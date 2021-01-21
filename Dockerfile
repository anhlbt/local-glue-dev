FROM amazon/aws-glue-libs:glue_libs_1.0.0_image_01

RUN rm /etc/apt/sources.list.d/jessie-backports.list && \
    apt-get update && \
    apt-get install -y default-mysql-client postgresql-client tree less tmux sudo

# Add user
RUN useradd -g users -G sudo -m -s /bin/bash ubuntu && \
    echo 'ubuntu:foobar' | chpasswd
RUN echo 'Defaults visiblepw'            >> /etc/sudoers
RUN echo 'ubuntu ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
RUN mkdir -p /home/ubuntu/app

RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-8.0.23.zip && \
    unzip mysql-connector-java-8.0.23.zip && \
    mv mysql-connector-java-8.0.23/mysql-connector-java-8.0.23.jar $SPARK_HOME/jars/ && \
    rm -rf mysql-connector-java-8.0.23
RUN wget https://jdbc.postgresql.org/download/postgresql-42.2.18.jar && \
    mv postgresql-42.2.18.jar $SPARK_HOME/jars/

COPY conf/spark-defaults.conf $SPARK_HOME/conf/spark-defaults.conf
COPY .bashrc /home/ubuntu
COPY bin/parquet-tools-1.11.0.jar /usr/local/bin/parquet-tools-1.11.0.jar

USER ubuntu

ENV PATH=$PATH:$SPARK_HOME/bin
