# Docker lemp stack with multiple PHP versions

## Documentation

### Requirements

Make sure you have installed `docker` and `docker-compose`. Both are easily installed via:

Docker: https://docs.docker.com/engine/installation/

Docker compose: https://docs.docker.com/compose/install/

### Launching containers

You can specify the configuration file with the `-f` flag, which will result in:

    docker-compose -f docker-compose.yml up --build -d

OR

    docker-compose up --build -d
