FROM sogis/oereb-db:latest

LABEL name="sogis/oereb-db-data"
LABEL vendor="AGI"
LABEL url="https://agi.so.ch"
LABEL summary="Image based on sogis/oereb-db providing a PostGIS database with OEREB tables"
LABEL description="This image provides a PostGIS database with OEREB tables containing data."

USER root

#mkdir oereb
COPY primary /tmp/primary
RUN chown -R 26:26 /tmp \
    && chmod -R 0700 /tmp/primary

COPY start.sh /opt/cpm/bin/start.sh 
COPY setenv.sh /opt/cpm/bin/setenv.sh

USER 26

HEALTHCHECK --interval=30s --timeout=30s --start-period=60s CMD /usr/pgsql-11/bin/pg_isready -h localhost -p 5432
