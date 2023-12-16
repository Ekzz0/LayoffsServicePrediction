FROM postgres:16
MAINTAINER Isotropic Tensor

ENV POSTGRES_DB=employee_db
ENV POSTGRES_USER=user
ENV POSTGRES_PASSWORD=password

COPY init.sql /docker-entrypoint-initdb.d/
