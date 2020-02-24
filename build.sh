#!/bin/bash

# build.sh

docker build -t arlis .
docker run -it arlis /bin/bash

