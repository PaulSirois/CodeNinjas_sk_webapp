FROM mysql:latest
ENV MYSQL_ROOT_PASSWORD admin
ENV MYSQL_TCP_PORT=7070
# port 3306 is open by default