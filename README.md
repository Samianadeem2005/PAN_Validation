# PAN Number Validation Project

## Overview

This project focuses on **data cleaning and validation** of a dataset containing **Permanent Account Numbers (PAN)** of Indian nationals.

The objective is to ensure that every PAN number follows the **official format rules** and to classify each record as **Valid PAN** or **Invalid PAN**.

The project demonstrates practical **data preprocessing, validation logic, and SQL-based data analysis**, which are essential skills for **Data Analysts and Data Scientists**.

---

# Project Objective

The main goal of this project is to:

* Clean the dataset
* Validate PAN numbers according to official rules
* Categorize each record into:

  * **Valid PAN**
  * **Invalid PAN**
* Generate a **summary report** with key statistics.

---

# Dataset

The dataset contains PAN numbers that may include:

* Missing values
* Duplicate records
* Incorrect formatting
* Invalid PAN patterns

These issues must be cleaned before performing validation.

**Note:** The original project task and detailed requirements are included in the **Problem Statement document** inside the `Docs` folder.

---

# Data Cleaning Steps

The following preprocessing steps were performed:

### 1. Handling Missing Values

* Records with missing PAN numbers were identified.
* Missing or incomplete values were categorized accordingly.

### 2. Removing Duplicate Records

* Duplicate PAN numbers were detected and removed to maintain data integrity.

### 3. Removing Extra Spaces

* Leading and trailing spaces around PAN numbers were removed.

### 4. Standardizing Letter Case

* All PAN numbers were converted to **uppercase format**.

---

# PAN Validation Rules

A valid PAN number must follow the format:

```
AAAAA1234A
```

### Format Requirements

1. **Length**

   * Exactly **10 characters**

2. **First 5 Characters**

   * Must be **uppercase alphabets**
   * Adjacent characters cannot be identical
     Example: `AABCD` not acceptable
   * Cannot form a full sequence
     Example: `ABCDE` not acceptable

3. **Next 4 Characters**

   * Must be **digits**
   * Adjacent digits cannot repeat
     Example: `1123`  not acceptable
   * Cannot form a full numeric sequence
     Example: `1234` not acceptable

4. **Last Character**

   * Must be **an uppercase alphabet**

### Example of Valid PAN

```
AHGVE1276F
```

---

# Categorization

Each PAN number is classified into one of the following categories:

* **Valid PAN**
* **Invalid PAN**
* **Missing / Incomplete PAN**

---

# Summary Report

The final report includes:

* Total records processed
* Total valid PAN numbers
* Total invalid PAN numbers
* Total missing or incomplete PAN numbers

---

# Technologies Used

* SQL (Data Cleaning & Validation)
* Git & GitHub (Version Control)

---

# Project Structure

```
PAN_Validation_Project
│
├── Data
│   └── PAN Number Validation Dataset.csv
│
├── SQL - Scripts
│   └── PAN_numbers_sql_script.sql
│
├── Output
│   └── Summary Report
│
└── Docs
    └── PAN Number Validation - Problem Statement.pdf
```

---

# Key Skills Demonstrated

* Data Cleaning
* Data Validation
* SQL Query Writing
* Data Quality Analysis
* Data Categorization

---

# Conclusion

This project demonstrates how raw data can be **cleaned, validated, and analyzed** to ensure data quality.

It highlights the importance of **data validation rules** in real-world datasets and showcases the use of **SQL for data preprocessing and reporting**.

---

# Author

**Samia Nadeem**

