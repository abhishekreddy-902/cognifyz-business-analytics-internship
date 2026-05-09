# 📊 Cognifyz Business Analytics Internship

![Status](https://img.shields.io/badge/Status-Completed-brightgreen)
![Tools](https://img.shields.io/badge/Tools-Excel%20%7C%20Python%20%7C%20PowerBI%20%7C%20MySQL-blue)
![Tasks](https://img.shields.io/badge/Tasks%20Completed-10%2F10-success)

## 🏢 Company: Cognifyz IT Solutions Pvt. Ltd.
**Role:** Business Analytics Intern  
**Duration:** April 2026 – May 2026  
**Ref No:** CTI/A1/C344055

---

## 📋 Project Overview

Analysis of an **Investment Behaviour Survey** dataset of **40 participants**
with **24 variables** — covering demographics, investment preferences,
savings objectives, information sources, and return expectations.

**All 10 assigned tasks completed across 4 levels (Beginner → Expert)**

---

## 📊 Power BI Dashboard

![Dashboard](Cognifyz%BA%Dashboard.png)   

---

## 🛠️ Tools Used

| Tool | What I Did |
|------|-----------|
| **Microsoft Excel** | Data cleaning, Pivot Tables, AVERAGE/MEDIAN/STDEV formulas, Charts |
| **Python (Jupyter)** | Pandas analysis, Matplotlib & Seaborn visualizations, Correlation heatmap |
| **Power BI Desktop** | Interactive dashboard, DAX measures, KPI cards, 4 slicers |
| **MySQL** | GROUP BY queries, CASE WHEN segmentation, UNION ALL statistics |

---

## 🐍 Python Code Samples

### Loading & Exploring Data
```python
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

# Load dataset
df = pd.read_csv('Data_set_2_-_Copy.csv')

# Dataset overview
print(f"Rows: {df.shape[0]}, Columns: {df.shape[1]}")
print(f"Missing Values: {df.isnull().sum().sum()}")
```

### Gender Distribution Analysis
```python
# Count and percentage
gender_counts = df['gender'].value_counts()
print(df['gender'].value_counts(normalize=True).mul(100).round(1))

# Visualization
fig, axes = plt.subplots(1, 2, figsize=(12, 5))
axes[0].pie(gender_counts.values, labels=gender_counts.index,
            autopct='%1.1f%%', colors=['#3498db', '#e74c3c'])
axes[0].set_title('Gender Distribution - Pie Chart')
axes[1].bar(gender_counts.index, gender_counts.values,
            color=['#3498db', '#e74c3c'], edgecolor='black')
axes[1].set_title('Gender Distribution - Bar Chart')
plt.tight_layout()
plt.savefig('Task2_Gender_Distribution.png', dpi=150)
plt.show()
```

### Most Preferred Investment Avenue
```python
# Frequency analysis
avenue_counts = df['Avenue'].value_counts()
print(f"Most Preferred: {avenue_counts.index[0]} ({avenue_counts.values[0]} investors)")

# Bar chart
plt.figure(figsize=(10, 5))
bars = plt.bar(avenue_counts.index, avenue_counts.values,
               color=['#2ecc71','#3498db','#e74c3c','#f39c12'],
               edgecolor='black')
for bar in bars:
    plt.text(bar.get_x() + bar.get_width()/2,
             bar.get_height() + 0.2,
             str(int(bar.get_height())),
             ha='center', fontweight='bold')
plt.title('Most Preferred Investment Avenue')
plt.savefig('Task4_Investment_Avenue.png', dpi=150)
plt.show()
```

### Correlation Heatmap
```python
# Correlation analysis
num_cols = ['age','Mutual_Funds','Equity_Market','Debentures',
            'Government_Bonds','Fixed_Deposits','PPF','Gold']
corr = df[num_cols].corr().round(2)

# Heatmap
plt.figure(figsize=(10, 7))
sns.heatmap(corr, annot=True, fmt='.2f', cmap='RdYlGn',
            linewidths=0.5, vmin=-1, vmax=1)
plt.title('Correlation Analysis Heatmap')
plt.savefig('Task10_Correlation_Heatmap.png', dpi=150)
plt.show()
```

---

## 🗄️ SQL Query Samples

### Gender Distribution with Percentage
```sql
SELECT
    gender,
    COUNT(*) AS Total_Count,
    ROUND(COUNT(*) * 100.0 / 
    (SELECT COUNT(*) FROM investment_data), 1) AS Percentage
FROM investment_data
GROUP BY gender
ORDER BY Total_Count DESC;
```

### Most Preferred Investment Avenue
```sql
SELECT
    Avenue,
    COUNT(*) AS Total_Investors,
    ROUND(COUNT(*) * 100.0 /
    (SELECT COUNT(*) FROM investment_data), 1) AS Percentage
FROM investment_data
GROUP BY Avenue
ORDER BY Total_Investors DESC;
```

### Age Group Segmentation (CASE WHEN)
```sql
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
```

### Descriptive Statistics (UNION ALL)
```sql
SELECT 'Age' AS Column_Name,
    ROUND(AVG(age), 2) AS Mean,
    MIN(age) AS Minimum,
    MAX(age) AS Maximum
FROM investment_data
UNION ALL
SELECT 'Mutual Funds',
    ROUND(AVG(Mutual_Funds), 2),
    MIN(Mutual_Funds),
    MAX(Mutual_Funds)
FROM investment_data
UNION ALL
SELECT 'Gold',
    ROUND(AVG(Gold), 2),
    MIN(Gold),
    MAX(Gold)
FROM investment_data;
```

### Gender vs Investment Avenue (Cross Analysis)
```sql
SELECT
    gender,
    Avenue,
    COUNT(*) AS Total
FROM investment_data
GROUP BY gender, Avenue
ORDER BY gender, Total DESC;
```

---

## 💼 Power BI DAX Measures

```dax
Total Investors = COUNTROWS('Data_set 2 - Copy')

Average Age = AVERAGE('Data_set 2 - Copy'[age])

Male Investors = 
CALCULATE(
    COUNTROWS('Data_set 2 - Copy'),
    'Data_set 2 - Copy'[gender] = "Male"
)

Male % = 
DIVIDE([Male Investors], [Total Investors], 0) * 100
```

---

## 🔍 Key Findings

| Finding | Result |
|---------|--------|
| Most Preferred Investment | Mutual Funds — 45% |
| Top Savings Goal | Retirement Planning — 60% |
| Most Trusted Info Source | Financial Consultants — 40% |
| Average Investor Age | 27.8 years |
| Gender Split | Male 62.5% — Female 37.5% |
| Return Expectation | 80% expect 20–30% returns |
| Preferred Duration | 1–3 years — 40% |

---

## 💡 Business Recommendations

- 🎯 Launch female-focused investment campaigns
- 📈 Prioritize Mutual Fund SIP product marketing
- 🏦 Create retirement planning products for young investors
- 🤝 Build financial consultant referral programs
- 📚 Run investor education on realistic return expectations

---


## 👤 About Me

**Abhishek Reddy** — Aspiring Data Analyst  
📍 Bengaluru, Karnataka  
🔗 [LinkedIn](https://www.linkedin.com/in/abhishekreddy111)  
🐙 [GitHub](https://github.com/AbhishekReddy-902)
