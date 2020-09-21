# commitizen-docker-image

> commitizen now avaialble in docker 💪

![Docker Pulls](https://img.shields.io/docker/pulls/commitizen/commitizen?style=flat-square)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/commitizen/commitizen/latest?style=flat-square)
![MicroBadger Layers (tag)](https://img.shields.io/microbadger/layers/commitizen/commitizen/latest?style=flat-square)

## Docker images

We publish only major versions starting with `v2`.

| Tag                            | Description                            |
| ------------------------------ | -------------------------------------- |
| `commitizen/commitizen:latest` | Latest major version, at the moment v2 |
| `commitizen/commitizen:2`      | Points to latest v2                    |

## Usage

## As Script

```bash
docker run --rm -v $(pwd):/app commitizen/commitizen:latest /bin/sh -c 'cz bump --changelog'
```

## Inside container

Open a terminal inside docker with `cz` available and with the current directory mounted.
This way we can run any `cz` command.

```bash
docker run --rm -it -v $(pwd):/app commitizen/commitizen:latest
```

## Contributing

### Build and push image

```bash
./scripts/build
./scripts/push
```

### Test locally

```bash
./scripts/build
./scripts/run 'cz ls'
```
