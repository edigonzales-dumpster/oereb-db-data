FROM sogis/oereb-db

LABEL name="sogis/oereb-db-data"
LABEL vendor="AGI"
LABEL url="https://agi.so.ch"
LABEL summary="Image based on sogis/oereb-db providing a PostGIS database with OEREB tables"
LABEL description="This image provides a PostGIS database with OEREB tables containing data."

USER root

COPY primary /pgdata/primary
COPY primary /tmp/primary
RUN chown -R 26:26 /pgdata
RUN chmod -R 0777 /pgdata
RUN chmod -R 0777 /pgdata/primary

USER 26
