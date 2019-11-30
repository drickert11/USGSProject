FROM postgres:alpine

ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD password  
ENV POSTGRES_DB app_staging 

COPY sql_dump.sql /docker-entrypoint-initdb.d/