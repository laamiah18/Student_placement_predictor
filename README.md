# Student_placement_predictor
# Intelligent Student Placement Prediction System

AI-powered placement prediction and career guidance system built using machine learning to evaluate student placement readiness and recommend suitable career paths.

---

## Project Overview

This project predicts whether a student is likely to get placed based on academic performance, internships, projects, certifications, aptitude, and communication skills.

The system also:

* Generates placement probability scores
* Identifies important placement factors
* Provides career guidance using skill-based evaluation
* Supports analytics for educators and institutions

---

## Dataset

The project uses the **Campus Recruitment Dataset** containing **7,000+ student records**.

### Dataset Source

* [Campus Recruitment Dataset (Hugging Face)](https://huggingface.co/datasets/Krooz/Campus_Recruitment_CSV?utm_source=chatgpt.com)

### Features Used

* CGPA
* Internship Experience
* Internship Flag
* Projects
* Certifications
* Aptitude Test Score
* Communication Skills
* Technical Skills

### Target Variable

* `Placement_Label`

  * `1` → Placed
  * `0` → Not Placed

---

## Data Preprocessing

The preprocessing pipeline included:

* Data inspection and validation
* Missing value analysis
* Outlier analysis
* Feature engineering
* Feature scaling using `StandardScaler`

### Engineered Features

* `Internship_Flag`
* `Placement_Label`
* `Technical_Skill_Score`

---

## Machine Learning Models

The following classification algorithms were trained and evaluated:

* Logistic Regression
* Decision Tree
* Support Vector Machine (SVM)
* K-Nearest Neighbors (KNN)
* Random Forest
* CatBoost

---

## Model Performance

### Random Forest

* Train Accuracy: **80.21%**
* Test Accuracy: **77.75%**

### CatBoost

* Train Accuracy: **83.15%**
* Test Accuracy: **76.87%**
* ROC-AUC Score: **0.81**
* Cross Validation Score: **0.75**

---

## Final Model Selection

### Selected Model: Random Forest

Random Forest was selected as the final model because it achieved:

* Higher testing accuracy
* Better generalization
* Stable performance across validation metrics

The trained model was saved using `joblib` for deployment.

---

## Feature Importance

The most influential factors affecting placement prediction were:

* Aptitude Test Score
* CGPA
* Communication Skills
* Technical Skills

---

## Prediction Logic

The model predicts placement probability between `0` and `1`.

* Probability ≥ `0.5` → **Placed**
* Probability < `0.5` → **Not Placed**

---

## Database Architecture (`student_placement_db`)

```text
            +-------------------+
            |       users       |
            +-------------------+
            | PK | user_id      |
            +----+--------------+
                   | 1
                   |
                   | *
            +-------------------+
            |     students      |
            +-------------------+
            | PK | student_id   |
            | FK | user_id      |
            +----+--------------+
                   | 1
                   |
                   | *
            +-------------------+
            |    predictions    |
            +-------------------+
            | PK | prediction_id|
            | FK | student_id   |
            +----+--------------+
                   | 1
                   |
                   | *
            +-------------------+
            | job_role_results  |
            +-------------------+
            | PK | result_id    |
            | FK | prediction_id|
            +----+--------------+
```

### Database Tables

* **users** → Stores login credentials and roles
* **students** → Stores academic and skill data
* **predictions** → Stores prediction history and probabilities
* **job_role_results** → Stores career suitability scores
* **bulk_uploads** → Handles CSV uploads and batch processing

---

## Tech Stack

* Python
* Pandas
* NumPy
* Scikit-learn
* CatBoost
* Joblib
* MySQL

---

## Contributors

* **Fathima Suha**
* **Laamiah Sulthana**
* **Devadyuthi**

