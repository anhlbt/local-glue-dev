# Local Glue environment

- [Developing AWS Glue ETL jobs locally using a container](https://aws.amazon.com/blogs/big-data/developing-aws-glue-etl-jobs-locally-using-a-container/)
- [Building an AWS Glue ETL pipeline locally without an AWS account](https://aws.amazon.com/blogs/big-data/building-an-aws-glue-etl-pipeline-locally-without-an-aws-account/)

```bash
docker-compose build
docker-compose up -d
docker-compose exec glue bash
```

# Example
## spark-submit

```bash
$ bash script/preprocess.sh
$ spark-submit example/s3_parquet.py --JOB_NAME=dummy --STAGE=production
$ aws s3 ls s3://test-bucket/spark/ --endpoint-url http://localstack:4566
2021-01-21 14:27:56          0 _SUCCESS
2021-01-21 14:27:55        975 part-00000-9a345736-c9ae-407a-af3c-84ac817d78c9-c000.snappy.parquet
2021-01-21 14:27:56        970 part-00001-9a345736-c9ae-407a-af3c-84ac817d78c9-c000.snappy.parquet

$ aws s3 cp \
    s3://test-bucket/spark/part-00000-9a345736-c9ae-407a-af3c-84ac817d78c9-c000.snappy.parquet \
    foo.snappy.parquet \
    --endpoint-url http://localstack:4566
$ parquet-tools cat foo.snappy.parquet
variable_1 = 1
variable_2 = 1.87
variable_3 = new_york

variable_1 = 4
variable_2 = 2.76
variable_3 = la

variable_1 = 6
variable_2 = 3.3
variable_3 = boston
```

## jupyter notebook

```bash
$ docker-compose exec glue /home/jupyter/jupyter_start.sh
```

Access http://localhost:8888 to use jupyter notebook.


## Access MySQL, Postgres and localstack

From container:
```bash
$ mysql -h db -uroot -ptest -P3306
$ psql -h db2 -Upostgres -p5432
$ aws s3 ls --endpoint-url http://localstack:4566
```

From host OS:
```bash
$ mysql -h 127.0.0.1 -uroot -ptest -P3306
$ psql -h 127.0.0.1 -Upostgres -p5432
$ aws s3 ls --endpoint-url http://localhost:4566
```
