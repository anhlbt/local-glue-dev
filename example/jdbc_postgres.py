import sys

from awsglue.utils import getResolvedOptions
from pyspark.sql import SparkSession

spark = SparkSession.builder.getOrCreate()

driver_class = "org.postgresql.Driver"
DB_USER      = "postgres"
DB_PASSWORD  = "test"
DB_TABLE     = "office.employee"
jdbc_url     = f"jdbc:postgresql://db2/"

df = spark.read.format("jdbc").options(
    url      = jdbc_url,
    driver   = driver_class,
    dbtable  = DB_TABLE,
    user     = DB_USER,
    password = DB_PASSWORD
).load()

df.show()
