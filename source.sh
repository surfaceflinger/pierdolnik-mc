podman pod create --name pierdolnik -p 25565:25565

podman run --detach \
  --env TYPE=VELOCITY \
  --env MEMORY=256M \
  --volume ./velocity_config:/config \
  --pod pierdolnik \
  --restart on-failure \
  --name velocity \
  docker.io/itzg/bungeecord

podman run --detach \
  --env EULA=TRUE \
  --env VERSION=1.17.1 \
  --env TYPE=PURPUR \
  --env MEMORY=1536M \
  --env COPY_CONFIG_DEST=/data \
  --env SPIGET_RESOURCES=28140,34315,85151 \
  --env MODS=https://github.com/EssentialsX/Essentials/releases/download/2.19.0/EssentialsX-2.19.0.jar,https://github.com/EssentialsX/Essentials/releases/download/2.19.0/EssentialsXChat-2.19.0.jar \
  --env OVERRIDE_SERVER_PROPERTIES=TRUE \
  --env ENABLE_WHITELIST=TRUE \
  --env SNOOPER_ENABLED=FALSE \
  --env SPAWN_PROTECTION=0 \
  --env ONLINE_MODE=FALSE \
  --env SERVER_PORT=25566 \
  --volume /var/pierdolnik/paper:/data \
  --volume ./paper_config:/config \
  --volume ./paper_plugins:/plugins \
  --volume ./datapacks:/worlds:ro -e WORLD=/worlds/advancements \
  --pod pierdolnik \
  --restart on-failure \
  --name paper \
  docker.io/itzg/minecraft-server:java16

