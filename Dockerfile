FROM alpine:3.3
ENV DB 1984.db
RUN apk update && apk add sqlite
COPY . /app
WORKDIR /app
RUN ./rot13-to-inserts.sh < rot13 | sqlite3 $DB && rm rot13
RUN ./http-response.sh $DB
CMD ./httpd.sh ./http-response.sh $DB
