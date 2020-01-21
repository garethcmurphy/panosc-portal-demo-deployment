FROM postgres:10

# Custom initialization scripts
COPY ./cloud-provider-kubernetes.sql /tmp/cloud-provider-kubernetes.sql
COPY ./cloud-provider-kubernetes.sh /docker-entrypoint-initdb.d/10-cloud-provider-kubernetes.sh

