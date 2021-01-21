import sys

from awsglue.context import GlueContext
from awsglue.dynamicframe import DynamicFrame
from pyspark.context import SparkContext
from pyspark.sql import SparkSession

glueContext = GlueContext(SparkContext.getOrCreate())

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

dyf = DynamicFrame.fromDF(df, glueContext, "dyf")
datasink = glueContext.write_dynamic_frame.from_options(
    frame = dyf,
    connection_type = "s3",
    connection_options = {"path": "s3://test-bucket/dynamicframe"},
    format = "parquet",
    transformation_ctx = "datasink")
