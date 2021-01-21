import sys

from pyspark.sql import SparkSession
from pyspark.sql.functions import udf
from pyspark.sql.types import LongType

spark = SparkSession.builder.getOrCreate()
df = spark.createDataFrame(
    [
        (1, 1.87, 'new_york'),
        (4, 2.76, 'la'),
        (6, 3.3, 'boston'),
        (8, 4.1, 'detroit'),
        (2, 5.70, 'miami'),
        (3, 6.320, 'atlanta')
    ],
    ('variable_1', "variable_2", "variable_3")
)

df.withColumn("foo", udf(lambda x: 10*x, LongType())("variable_1")).show()
