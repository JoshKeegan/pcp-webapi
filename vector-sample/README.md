# Vector Sample
A quick sample of how to use this image to monitor your server(s) with dashboards in [Vector](https://github.com/Netflix/vector).  

For a single server on a private network (so we don't need to worry about exposing the PCP Web API to the internet), 
this is as simple as running two containers:
 - `joshkeegan/pcp-webapi` (this one)
 - `netflixoss/vector` (the official Docker image for Vector)

The easiest way to do this is via docker compose. The `docker-compose.yml` file to do so is included in this directory.  
If you run that and then connect to your server on port 8080 via a web browser (http), you will get the Vector dashboard.  
Then point it to PCP on your server, port 44323 and you're up and running!

## Multi-Server
For multiple servers, you will only need one instance of Vector (although you can have multiple for high availability).  
Simply run a container with the `joshkeegan/pcp-webapi` image on each server you wish to monitor and you can point the
Vector dashboard to each of your servers.  

## Securing
On an internet facing server, you probably don't want everyone to have access to your monitoring, or the PCP API...  
TODO!