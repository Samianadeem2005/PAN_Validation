--- create table
create table pan_numbers(
pan_no text
)

select * from pan_numbers;


--Identify and handle missing data
select * from pan_numbers
where pan_no is null;


--Check for duplicates
select * from pan_numbers
group by pan_no
having count(pan_no)>1;


--Handle leading/trailing spaces
select * from pan_numbers
where pan_no<>trim(pan_no);


--Correct letter case
select * from pan_numbers
where pan_no <> upper(pan_no);


--Data Cleaning and Preprocessing:
update pan_numbers
set pan_no = trim(pan_no);

select distinct upper(pan_no) from pan_numbers
where pan_no is not null 
and pan_no <> '';



--function to check adjacent characters
CREATE FUNCTION check_adjacent(str text)
RETURNS boolean as $$
BEGIN 
	FOR i in 1 .. length(str)-1
	LOOP
		IF SUBSTRING(str,i,1)= SUBSTRING(str,i+1,1) --Are 2 characters adjacent
		THEN
			RETURN true;--- yes , it is same
		END IF;
	END LOOP;
	RETURN false; --none of the characters are same
END;
$$ LANGUAGE plpgsql;

SELECT check_adjacent('1123');

--or I can use this 
SELECT pan_no
FROM pan_numbers
WHERE pan_no ~ '(.)\1';


---function to check the sequence 
CREATE FUNCTION check_sequence(str text)
RETURNS boolean as $$
BEGIN
	FOR i in 1 .. LENGTH(str)-1
	LOOP
		IF ascii(SUBSTRING(str,i+1,1))-ascii(SUBSTRING(str,i,1)) <> 1 -- Do Sequence exists in full string
		THEN
			RETURN false;-- no it doesnt exist , so loop breaks
		END IF;
	END LOOP;	
	RETURN true;--  yes there is sequence
END;
$$ LANGUAGE plpgsql;


select check_sequence('123');


--Checking Format of PAN
SELECT * from pan_numbers
WHERE pan_no ~ '^[A-Z]{5}[0-9]{4}[A-Z]$';


--- PAN Format Validation and Categorization:
CREATE or replace view  valid_invalid_pan as (
   with cleaned as (
		select distinct upper(pan_no) as pan_no from pan_numbers
		where pan_no is not null 
		and pan_no <> ''
	),
	valid_pan as (	
		SELECT * from cleaned
		WHERE check_adjacent(SUBSTRING(pan_no,1,5))= FALSE
		AND check_sequence(SUBSTRING(pan_no,1,5))= FALSE
		AND check_adjacent(SUBSTRING(pan_no,6,9))= FALSE
		AND check_sequence(SUBSTRING(pan_no,6,9))= FALSE
		AND pan_no ~ '^[A-Z]{5}[0-9]{4}[A-Z]$'
	)
	
	SELECT c.pan_no , 
	CASE 
		WHEN vp.pan_no IS NULL THEN 'invalid_pan'
		ELSE 'valid_pan'
	END as category
	FROM cleaned c LEFT JOIN valid_pan vp 
	ON c.pan_no= vp.pan_no
)

--Create a summary report:
WITH CTE AS (
    SELECT count(*) as TOTAL_RECORDS , 
	(SELECT count(*) as Valid_Pans
	 FROM valid_invalid_pan
	 where category = 'valid_pan'
	),
	(SELECT count(*) as Invalid_Pans
	 FROM valid_invalid_pan
	 where category = 'invalid_pan'
	)
	FROM pan_numbers)

SELECT * , (TOTAL_RECORDS- (Valid_Pans+Invalid_Pans)) as Missing
FROM CTE;








