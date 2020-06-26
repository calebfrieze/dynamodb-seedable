FROM centos:7

RUN yum  --enablerepo=centosplus install -y \
    wget \
    unzip \
    java-11-openjdk

# Install DynamoDB
RUN wget https://s3-us-west-2.amazonaws.com/dynamodb-local/dynamodb_local_latest.tar.gz -q -O - | tar -xz

# Install AWS
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
RUN unzip awscliv2.zip
RUN ./aws/install

# Initialization scripts
COPY seed-data.sh /usr/bin
RUN chmod +x /usr/bin/seed-data.sh
COPY dynamodb-bootstrap.sh /usr/bin
RUN chmod +x /usr/bin/dynamodb-bootstrap.sh

# Docker entrypoint script to run dynamo and aws setup
COPY docker-entrypoint.sh /usr/bin
RUN chmod +x /usr/bin/docker-entrypoint.sh

ENTRYPOINT [ "docker-entrypoint.sh" ]
