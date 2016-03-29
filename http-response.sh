#!/bin/sh
echo -e "HTTP/1.1 200 OK\n\n"; sqlite3 $1 < dissociated-text.sql | tr "\n" " " | tr "~" "\n"
