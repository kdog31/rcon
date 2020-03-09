# RCON
RCON web admin docker container, updated to pull from lacaulac/rcon-web-admin.

Original RCON-web-admin project by Github user brainfoolong, currently maintained by lacaulac.
Original RCON-web-admin docker container by Docker Hub user itzg, updated by kdog31 to pull from lacaulac's repository.
No other changes have been made to the container.

# Getting Started
To get up and running quickly, use
```docker run -d -p 4326:4326 -p 4327:4327 kdog31/rcon```
With that you can follow the [Regular Instructions](https://github.com/lacaulac/rcon-web-admin) and access the web UI at http://YOUR_DOCKER_HOST:4326

# Options
## Volumes
- /opt/rcon-web-admin/db
## Ports
- 4326: Web UI
- 4327: Websocket access from UI

# Setup with docker-compose
Alternativly you may use a docker-compose.yml file to configure your container.

#### Example docker-compose.yml file.
```
version: '3'
services:
    rcon:
        image: kdog31/rcon
        ports:
            - "4326:4326"
            - "4327:4327"
        volumes:
            - ./db:/opt/rcon-web-admin/db
```