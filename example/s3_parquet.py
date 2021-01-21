import sys

from awsglue.utils import getResolvedOptions
from pyspark.sql import SparkSession

args = getResolvedOptions(sys.argv, ['JOB_NAME', 'STAGE'])

print(args['JOB_NAME'])
print(args['STAGE'])

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

df = df.coalesce(2)

df.write.mode("overwrite").format("parquet") \
    .option("compression", "snappy") \
    .save("s3://test-bucket/spark/")
