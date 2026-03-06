from pyspark.sql import SparkSession

spark = SparkSession.builder.appName("left_semi_join_example").getOrCreate()

# Employees DataFrame (Left)
data_employees = [(1, "John", "HR"), 
                  (1, "John", "HR"), 
                  (2, "Emma", "Engineering"), 
                  (3, "Raj", "Marketing"), 
                  (4, "Nina", "HR"),
                  (5, "Mike", "Finance")]
columns_employees = ["employee_id", "name", "department"]
df_employees = spark.createDataFrame(data_employees, columns_employees)

# Salaries DataFrame (Right) - Mike (ID 5) has no salary record
data_salaries = [(1, 60000), 
                 (1, 60000), 
                 (2, 80000), 
                 (3, 70000), 
                 (4, 75000),
                 (7,15000)]
columns_salaries = ["employee_id", "salary"]
df_salaries = spark.createDataFrame(data_salaries, columns_salaries)

print("Employees DataFrame:")
#df_employees.show()

print("Salaries DataFrame:")
#df_salaries.show()
df_employees.join(df_salaries, on="employee_id", how="cross").show()
