import sqlite3 
import pandas as pd
import matplotlib.pyplot as plt

# Connect to SQLite database
conn = sqlite3.connect("data/Hospital-Performance-Analytics_hospital.db")

# Query
query = """
SELECT *
FROM patients;
"""

# Load into DataFrame
df = pd.read_sql_query(query, conn)

# Show first rows
print(df.head())

# Basic patient analysis
print("\nDataFrame information:")
df.info()

print("\nSummary statistics:")
print(df.describe())

print("\nPatients by gender:")
print(df["gender"].value_counts())

print("\nAverage patient age:")
print(round(df["anchor_age"].mean(), 2))

# Patients by Gender
gender_counts = df["gender"].value_counts()

plt.figure(figsize=(6,4))

gender_counts.plot(kind="bar")

plt.title("Patients by Gender")
plt.xlabel("Gender")
plt.ylabel("Number of Patients")
plt.savefig("images/charts/patients_by_gender.png")
plt.show()

# Age Distribution

plt.figure(figsize=(8,5))

plt.hist(df["anchor_age"], bins=10)

plt.title("Age Distribution of Patients")
plt.xlabel("Age")
plt.ylabel("Number of Patients")
plt.savefig("images/charts/age_distribution.png")
plt.show()

# Load admissions table
admissions = pd.read_sql_query(
    "SELECT * FROM admissions;",
    conn
)

# Admissions by Type
admission_counts = admissions["admission_type"].value_counts()

plt.figure(figsize=(8,5))

admission_counts.plot(kind="bar")

plt.title("Admissions by Type")
plt.xlabel("Admission Type")
plt.ylabel("Number of Admissions")

plt.xticks(rotation=45)

plt.tight_layout()
plt.savefig("images/charts/admissions_by_type.png")
plt.show()

# Insurance Distribution
insurance_counts = admissions["insurance"].value_counts()

plt.figure(figsize=(8,5))

insurance_counts.plot(kind="bar")

plt.title("Insurance Distribution")
plt.xlabel("Insurance Type")
plt.ylabel("Number of Admissions")

plt.xticks(rotation=45)

plt.tight_layout()
plt.savefig("images/charts/insurance_distribution.png")
plt.show()

# Race Distribution
race_counts = admissions["race"].value_counts()

plt.figure(figsize=(10,6))

race_counts.plot(kind="bar")

plt.title("Race Distribution")
plt.xlabel("Race")
plt.ylabel("Number of Admissions")

plt.xticks(rotation=45)

plt.tight_layout()
plt.savefig("images/charts/race_distribution.png")
plt.show()

# Load services table
services = pd.read_sql_query(
    "SELECT * FROM services;",
    conn
)

# Current Services Distribution
service_counts = services["curr_service"].value_counts()

plt.figure(figsize=(10,6))

service_counts.plot(kind="bar")

plt.title("Current Hospital Services")
plt.xlabel("Service")
plt.ylabel("Number of Patients")

plt.xticks(rotation=45)

plt.tight_layout()
plt.savefig("images/charts/current_services.png")
plt.show()

# Top 10 Previous Services
previous_services = services["prev_service"].value_counts().head(10)

plt.figure(figsize=(10,6))

previous_services.plot(kind="bar")

plt.title("Top 10 Previous Hospital Services")
plt.xlabel("Previous Service")
plt.ylabel("Number of Patients")

plt.xticks(rotation=45)

plt.tight_layout()
plt.savefig("images/charts/top_previous_services.png")
plt.show()

# Convert admission time to datetime
admissions["admittime"] = pd.to_datetime(admissions["admittime"])

# Count admissions by year
admissions_per_year = admissions["admittime"].dt.year.value_counts().sort_index()

plt.figure(figsize=(8,5))

admissions_per_year.plot(kind="line", marker="o")

plt.title("Admissions per Year")
plt.xlabel("Year")
plt.ylabel("Number of Admissions")

plt.grid(True)

plt.tight_layout()
plt.savefig("images/charts/admissions_per_year.png")
plt.show()


# Close connection
conn.close()