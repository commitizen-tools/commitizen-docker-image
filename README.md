# commitizen-docker-image

> commitizen now available in docker 💪

![Docker Pulls](https://img.shields.io/docker/pulls/commitizen/commitizen?style=flat-square)
![Docker Image Size (tag)](https://img.shields.io/docker/image-size/commitizen/commitizen/latest?style=flat-square)
![Docker Image Version (latest semver)](https://img.shields.io/docker/v/commitizen/commitizen?style=flat-square)

## Docker images

We publish major versions starting with `v4` + latest exact v4.

| Tag                            | Description                                                     |
| ------------------------------ | --------------------------------------------------------------- |
| `commitizen/commitizen:latest` | Latest major version, at the moment v4                          |
| `commitizen/commitizen:4`      | Points to latest v4                                             |
| `commitizen/commitizen:4.x`    | See [tags](https://hub.docker.com/r/commitizen/commitizen/tags) |
| `commitizen/commitizen:3`      | Points to latest v3                                             |
| `commitizen/commitizen:3.x`    | See [tags](https://hub.docker.com/r/commitizen/commitizen/tags) |
| `commitizen/commitizen:2`      | Points to latest v2                                             |
| `commitizen/commitizen:2.x`    | See [tags](https://hub.docker.com/r/commitizen/commitizen/tags) |

This repo checks daily for the latest version and tries to publish it.

## Migrating to `v4`

Nothing has changed, python 3.8 support has been dropped.

## Migrating from `v2` to `v3` image

We've moved this images from using `CMD` to `ENTRYPOINT` for `v3`.

Where you were doing this:

```sh
docker run --rm --name commitizen registry.hub.docker.com/commitizen/commitizen:2 /bin/sh -c "cz ls"
```

Now you only need to do:

```sh
docker run --rm --name commitizen registry.hub.docker.com/commitizen/commitizen:3 ls
```

## Usage

## As Script

```bash
docker run --rm \
  -v $(pwd):/app \
  commitizen/commitizen:latest \
  bump --changelog
```

## Inside container

Open a terminal inside docker with `cz` available and with the current directory mounted.
This way we can run any `cz` command.

```bash
docker run --rm -it \
  --entrypoint /bin/sh \
  -v $(pwd):/app \
  commitizen/commitizen:latest
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
./scripts/cz ls
```
