CREATE TABLE BankChurn (
    CustomerId INT PRIMARY KEY,
    CreditScore INT,
    Geography VARCHAR(50),
    Gender VARCHAR(10),
    Age INT,
    Tenure INT,
    Balance FLOAT,
    NumOfProducts INT,
    HasCrCard INT,
    IsActiveMember INT,
    EstimatedSalary FLOAT,
    Exited INT
);
SELECT * FROM BankChurn LIMIT 10;
SELECT COUNT(*) AS Total_Customers FROM BankChurn;
SELECT COUNT(*) AS Churned_Customers FROM BankChurn WHERE Exited = 1;
SELECT 
    (COUNT(CASE WHEN Exited = 1 THEN 1 END) * 100.0) / COUNT(*) AS Churn_Rate
FROM BankChurn;
SELECT CustomerId, Age, Geography, Balance, EstimatedSalary
FROM BankChurn
WHERE Exited = 1
ORDER BY Age DESC
LIMIT 10;
SELECT Geography, COUNT(*) AS Churned_Count
FROM BankChurn
WHERE Exited = 1
GROUP BY Geography
ORDER BY Churned_Count DESC;
SELECT Exited, AVG(Balance) AS Avg_Balance
FROM BankChurn
GROUP BY Exited;
SELECT CustomerId, Age, Geography, IsActiveMember
FROM BankChurn
WHERE Exited = 1 AND IsActiveMember = 1;
SELECT CustomerId, Age, Geography, NumOfProducts, IsActiveMember
FROM BankChurn
WHERE Exited = 1 AND NumOfProducts > 1
ORDER BY NumOfProducts DESC;
SELECT CustomerId, Age, Geography, CreditScore, Balance, HasCrCard
FROM BankChurn
WHERE Exited = 1 AND HasCrCard = 1
ORDER BY CreditScore DESC;
SELECT CustomerId, Age, Geography, Balance, EstimatedSalary
FROM BankChurn
WHERE Exited = 1 AND Balance > (SELECT AVG(Balance) FROM BankChurn)
ORDER BY Balance DESC;










