FROM mysql

ENV MYSQL_DATABASE Conference_Review

COPY ./sql-scripts/ /docker-entrypoint-initdb.d/