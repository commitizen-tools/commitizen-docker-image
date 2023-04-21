# commitizen-docker-image

> commitizen now avaialble in docker 💪

![Docker Pulls](https://img.shields.io/docker/pulls/commitizen/commitizen?style=flat-square)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/commitizen/commitizen/latest?style=flat-square)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/commitizen/commitizen?style=flat-square)

## Docker images

We publish major versions starting with `v3` + latest exact v3.

| Tag                            | Description                                                     |
| ------------------------------ | --------------------------------------------------------------- |
| `commitizen/commitizen:latest` | Latest major version, at the moment v3                          |
| `commitizen/commitizen:3`      | Points to latest v3                                             |
| `commitizen/commitizen:3.x`    | See [tags](https://hub.docker.com/r/commitizen/commitizen/tags) |
| `commitizen/commitizen:2`      | Points to latest v2                                             |
| `commitizen/commitizen:2.x`    | See [tags](https://hub.docker.com/r/commitizen/commitizen/tags) |

This repo checks daily for the latest version and tries to publish it.

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
