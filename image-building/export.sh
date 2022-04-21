#!/bin/bash

docker save image_pega-pe-backend:latest | gzip > ./export/image_pega-pe-backend.tar.gz
docker save image_pega-pe-frontend:latest | gzip > ./export/image_pega-pe-frontend.tar.gz

