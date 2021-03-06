# Deprecated
Warning: this repo is deprecated and will no longer be maintained.  
pcp-webapi has been replaced by pmproxy , included in the standard pcp package.
Examples refer to Netflix's Vector but that is also now deprecated in favour of the Grafana pcp plugin.

# Docker Image: pcp-webapi
A Docker image for [PCP (Performance Co-Pilot)](https://github.com/performancecopilot/pcp) and its Web API.  

## Usage
The docker image is available at `joshkeegan/pcp-webapi`. You can use the (default) `latest` tag to always 
stay up to date, or see [Docker Hub](https://hub.docker.com/r/joshkeegan/pcp-webapi/tags/) for specific version tags.  

Running the image is slightly more involved than a typical `docker run` as PCP needs access to a few things on the host system
in order to monitor it.  
Sample `docker run`:
```bash
docker run \
    -d \
    --privileged \
    --pid=host \
    --ipc=host \
    -v /sys:/sys:ro \
    -v /etc/localtime:/etc/localtime:ro \
    -v /var/lib/docker:/var/lib/docker:ro \
    -v /run:/run \
    -v /var/log:/var/log \
    -v /dev/log:/dev/log \
    --name=pcp-webapi \
    -p 44323:44323 \
    --restart=always \
    joshkeegan/pcp-webapi
```

### With Vector
This image was made to be used with [Vector](https://github.com/Netflix/vector) (although there's no reason it can't be used by itself).  
See the [Vector sample](vector-sample/README.md) for instructions.

## Publishing
Note: only people authorised to publish to this repo on Docker Hub can publish the image.

 - Log in to Docker Hub (with `docker login`). 
 - Let `make` handle everything else:
```bash
make publish
```

## License
[MIT](LICENSE)