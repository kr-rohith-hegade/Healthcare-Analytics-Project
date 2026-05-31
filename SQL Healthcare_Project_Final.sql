create database data_healthcare_patient_d;
use data_healthcare_patient_d;

# 1. Data Count Validation

SELECT COUNT(*) FROM Patient;
SELECT COUNT(*) FROM Visit;
SELECT COUNT(*) FROM Treatments;
SELECT COUNT(*) FROM LabResult;


# 2. Data Completeness Check
# Identify missing or null values in key columns.

select *from Patient;
SELECT * FROM Patient WHERE FirstName IS NULL OR LastName IS NULL;
SELECT * FROM Visit WHERE VisitType IS NULL OR VisitDate IS NULL;
SELECT * FROM Treatments WHERE TreatmentName IS NULL OR Status IS NULL;
SELECT * FROM LabResult WHERE TestName IS NULL OR TestResult IS NULL;



# 3. Data Consistency Check

SELECT v.VisitID, v.PatientID, p.PatientID
FROM Visit v
LEFT JOIN Patient p ON v.PatientID = p.PatientID
WHERE p.PatientID IS NULL;

SELECT t.TreatmentID, t.VisitID, v.VisitID
FROM Treatments t
LEFT JOIN Visit v ON t.VisitID = v.VisitID
WHERE v.VisitID IS NULL;

#4. Duplicate Records Check
# Identify duplicate entries in key tables.

SELECT Patientid, COUNT(*)
FROM Patient
GROUP BY PatientID
HAVING COUNT(*) > 1;

SELECT VisitID, COUNT(*)
FROM Visit
GROUP BY VisitID
HAVING COUNT(*) > 1;

#5.Dashboard Aggregation Check 
SELECT SUM(TreatmentCost) FROM Treatments; 

SELECT AVG(Age) FROM Patient;

#6.Performance Testing (Query Execution Time)
EXPLAIN 
SELECT * FROM Visit WHERE VisitDate BETWEEN '2023-01-01' AND '2023-12-31';