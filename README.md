# oereb-db-data

Run database:
```
docker run --rm --name oereb-db-data -p 54321:5432 --hostname primary \
-e PG_DATABASE=oereb -e PG_LOCALE=de_CH.UTF-8 -e PG_PRIMARY_PORT=5432 -e PG_MODE=primary \
-e PG_USER=admin -e PG_PASSWORD=admin \
-e PG_PRIMARY_USER=repl -e PG_PRIMARY_PASSWORD=repl \
-e PG_ROOT_PASSWORD=secret \
-e PG_WRITE_USER=gretl -e PG_WRITE_PASSWORD=gretl \
-e PG_READ_USER=ogc_server -e PG_READ_PASSWORD=ogc_server \
-e PGDATA=/tmp/primary \
sogis/oereb-db-data:latest
```


Create image:
```
gradle -I $PWD/init.gradle -b build.gradle buildOerebDbDataDockerImage -Pflavor=full|plr|replace
```

- `full`: Datenbank wird komplett mit allen Daten (AV, PLZ/Ortschaft, Annex, Bundedaten etc.) erstellt.
- `plr`: Datenbank wird nur mit den kantonalen ÖREB-Daten (plus die Daten, die zwingend benötigt werden) erstellt.
- `replace`: Kantonale ÖREB-Daten werden im ausgetauscht. Bedingt, dass das DB-Datenverzeichnis noch vorhanden ist auf dem Filesystem.

Tags:
- oereb-db:69 used in `build.gradle` and `Dockerfile`
