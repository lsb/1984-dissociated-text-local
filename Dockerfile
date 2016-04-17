FROM alpine:3.3
RUN apk update && apk add sqlite && rm -r /var/cache/apk/*
COPY rot13 /app/
COPY rot13-to-inserts.sh /app/
COPY dissociated-text.sql /app/sql
WORKDIR /app
RUN ./rot13-to-inserts.sh < rot13 | sqlite3 db && rm rot13
WORKDIR /www
COPY 1984 cgi-bin/
RUN ./cgi-bin/1984
CMD ["httpd", "-f"]
