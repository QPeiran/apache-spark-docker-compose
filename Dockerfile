# Basic java 11 JDK
FROM eclipse-temurin:11-jdk

# Install basic tools
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
      sudo \
      curl \
      rsync \
      ssh \
      unzip && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Env variables
ENV SPARK_HOME="/opt/spark"
ENV SPARK_VERSION="3.5.4"
ENV PATH="${SPARK_HOME}/bin:${SPARK_HOME}/sbin:${PATH}"

# download Spark and delta essentials
RUN mkdir -p ${SPARK_HOME} \
    && curl -L "https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop3.tgz" -o spark.tgz \
    && tar xzf spark.tgz --strip-components=1 -C ${SPARK_HOME} \
    && rm spark.tgz

CMD ["spark-shell"]