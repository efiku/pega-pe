#!/bin/bash

# Load images with layers into cache

docker load < ./import/image_pega-pe-backend.tar.gz
docker load < ./import/image_pega-pe-frontend.tar.gz

# run container to start first time restore run.
docker-compose up -d backend

# check progress of restore and break log view when it ends.
docker-compose logs -f


# run web and wait
docker-compose up -d frontend

# check open port for 8080 internal.
docker-compose ps

