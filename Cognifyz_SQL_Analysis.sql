CREATE DATABASE cognifyz_project;

USE cognifyz_project;

CREATE TABLE investment_data (
    id              INT AUTO_INCREMENT PRIMARY KEY,
    gender          VARCHAR(10),
    age             INT,
    Mutual_Funds    INT,
    Equity_Market   INT,
    Debentures      INT,
    Government_Bonds INT,
    Fixed_Deposits  INT,
    PPF             INT,
    Gold            INT,
    Factor          VARCHAR(50),
    Objective       VARCHAR(50),
    Purpose         VARCHAR(50),
    Duration        VARCHAR(30),
    Invest_Monitor  VARCHAR(30),
    Expect          VARCHAR(20),
    Avenue          VARCHAR(30),
    Savings_Objective VARCHAR(30),
    Reason_Equity   VARCHAR(50),
    Reason_Mutual   VARCHAR(50),
    Reason_Bonds    VARCHAR(50),
    Reason_FD       VARCHAR(50),
    Source          VARCHAR(50)
);




SELECT * FROM investment_data;



-- ============================================
-- TASK 1: DATA OVERVIEW
-- ============================================

-- Total rows
SELECT COUNT(*) AS Total_Investors
FROM investment_data;

-- Check NULL values in all key columns

SELECT
    SUM(CASE WHEN gender IS NULL THEN 1 ELSE 0 END)           AS Null_Gender,
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END)              AS Null_Age,
    SUM(CASE WHEN Avenue IS NULL THEN 1 ELSE 0 END)           AS Null_Avenue,
    SUM(CASE WHEN Source IS NULL THEN 1 ELSE 0 END)           AS Null_Source,
    SUM(CASE WHEN Duration IS NULL THEN 1 ELSE 0 END)         AS Null_Duration,
    SUM(CASE WHEN Expect IS NULL THEN 1 ELSE 0 END)           AS Null_Expect,
    SUM(CASE WHEN Savings_Objective IS NULL THEN 1 ELSE 0 END) AS Null_Savings
FROM investment_data;


-- ============================================
-- TASK 2: GENDER DISTRIBUTION
-- ============================================

SELECT
    gender,
    COUNT(*) AS Total_Count,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM investment_data), 1)
    AS Percentage
FROM investment_data
GROUP BY gender
ORDER BY Total_Count DESC;


-- ============================================
-- TASK 3: DESCRIPTIVE STATISTICS
-- ============================================

SELECT
    'Age' AS Column_Name,
    ROUND(AVG(age), 2)    AS Mean,
    MIN(age)              AS Minimum,
    MAX(age)              AS Maximum,
    MAX(age) - MIN(age)   AS Range_Value
FROM investment_data

UNION ALL

SELECT
    'Mutual Funds',
    ROUND(AVG(Mutual_Funds), 2),
    MIN(Mutual_Funds),
    MAX(Mutual_Funds),
    MAX(Mutual_Funds) - MIN(Mutual_Funds)
FROM investment_data

UNION ALL

SELECT
    'Equity Market',
    ROUND(AVG(Equity_Market), 2),
    MIN(Equity_Market),
    MAX(Equity_Market),
    MAX(Equity_Market) - MIN(Equity_Market)
FROM investment_data

UNION ALL

SELECT
    'Fixed Deposits',
    ROUND(AVG(Fixed_Deposits), 2),
    MIN(Fixed_Deposits),
    MAX(Fixed_Deposits),
    MAX(Fixed_Deposits) - MIN(Fixed_Deposits)
FROM investment_data

UNION ALL

SELECT
    'Gold',
    ROUND(AVG(Gold), 2),
    MIN(Gold),
    MAX(Gold),
    MAX(Gold) - MIN(Gold)
FROM investment_data;




-- ============================================
-- TASK 4: MOST PREFERRED INVESTMENT AVENUE
-- ============================================

-- Full breakdown
SELECT
    Avenue,
    COUNT(*) AS Total_Investors,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM investment_data), 1)
    AS Percentage
FROM investment_data
GROUP BY Avenue
ORDER BY Total_Investors DESC;

-- Just the top 1
SELECT
    Avenue AS Most_Preferred,
    COUNT(*) AS Total_Investors
FROM investment_data
GROUP BY Avenue
ORDER BY Total_Investors DESC
LIMIT 1;




-- ============================================
-- TASK 5: REASONS FOR INVESTMENT
-- ============================================

-- Equity reasons
SELECT 'Equity' AS Type, Reason_Equity AS Reason, COUNT(*) AS Count
FROM investment_data
GROUP BY Reason_Equity
ORDER BY Count DESC;

-- Mutual Fund reasons
SELECT 'Mutual Fund' AS Type, Reason_Mutual AS Reason, COUNT(*) AS Count
FROM investment_data
GROUP BY Reason_Mutual
ORDER BY Count DESC;

-- Bond reasons
SELECT 'Bonds' AS Type, Reason_Bonds AS Reason, COUNT(*) AS Count
FROM investment_data
GROUP BY Reason_Bonds
ORDER BY Count DESC;

-- Fixed Deposit reasons
SELECT 'Fixed Deposit' AS Type, Reason_FD AS Reason, COUNT(*) AS Count
FROM investment_data
GROUP BY Reason_FD
ORDER BY Count DESC;



-- ============================================
-- TASK 6: SAVINGS OBJECTIVES
-- ============================================

SELECT
    Savings_Objective,
    COUNT(*) AS Total_Investors,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM investment_data), 1)
    AS Percentage
FROM investment_data
GROUP BY Savings_Objective
ORDER BY Total_Investors DESC;



-- ============================================
-- TASK 7: INFORMATION SOURCES
-- ============================================

SELECT
    Source,
    COUNT(*) AS Total_Investors,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM investment_data), 1)
    AS Percentage
FROM investment_data
GROUP BY Source
ORDER BY Total_Investors DESC;



-- ============================================
-- TASK 8: INVESTMENT DURATION
-- ============================================

SELECT
    Duration,
    COUNT(*) AS Total_Investors,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM investment_data), 1)
    AS Percentage
FROM investment_data
GROUP BY Duration
ORDER BY Total_Investors DESC;



-- ============================================
-- TASK 9: EXPECTATIONS FROM INVESTMENTS
-- ============================================

SELECT
    Expect AS Expected_Return,
    COUNT(*) AS Total_Investors,
    ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM investment_data), 1)
    AS Percentage
FROM investment_data
GROUP BY Expect
ORDER BY Total_Investors DESC;



-- ============================================
-- TASK 10: ADVANCED ANALYSIS
-- ============================================

-- 1. Gender vs Avenue (cross analysis)
SELECT
    gender,
    Avenue,
    COUNT(*) AS Total
FROM investment_data
GROUP BY gender, Avenue
ORDER BY gender, Total DESC;

-- 2. Average age by investment avenue
SELECT
    Avenue,
    ROUND(AVG(age), 1) AS Avg_Age,
    COUNT(*) AS Total_Investors
FROM investment_data
GROUP BY Avenue
ORDER BY Avg_Age;

-- 3. Young vs Senior investor preferences
SELECT
    CASE
        WHEN age < 28 THEN 'Young Investor (Under 28)'
        ELSE 'Senior Investor (28 and above)'
    END AS Age_Group,
    Avenue,
    COUNT(*) AS Total
FROM investment_data
GROUP BY Age_Group, Avenue
ORDER BY Age_Group, Total DESC;

-- 4. Gender vs Savings Objective
SELECT
    gender,
    Savings_Objective,
    COUNT(*) AS Total
FROM investment_data
GROUP BY gender, Savings_Objective
ORDER BY gender, Total DESC;

-- 5. Duration vs Expected Returns
SELECT
    Duration,
    Expect,
    COUNT(*) AS Total_Investors
FROM investment_data
GROUP BY Duration, Expect
ORDER BY Duration, Total_Investors DESC;
