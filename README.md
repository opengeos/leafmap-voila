# leafmap-voila

Build a docker image for using leafmap with Voila

To build the image:

```bash
docker buildx build --platform linux/amd64,linux/arm64 -t giswqs/leafmap:voila --push .
```

To run the image:

```bash
docker run -it -p 8866:8866 -v $(pwd):/home/jovyan/notebooks giswqs/leafmap:voila
```

To push the image to the registry:

```bash
docker push giswqs/leafmap:voila
```
