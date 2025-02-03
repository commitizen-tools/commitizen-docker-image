FROM python:3-alpine

LABEL org.opencontainers.image.source="https://github.com/commitizen-tools/commitizen"
LABEL org.opencontainers.image.description="Commitizen is release management tool designed for teams"

WORKDIR /app

# Add dependencies
RUN apk add --update -t --no-cache git curl alpine-sdk
RUN ["pip", "install", "-U", "--no-cache-dir", "pip"]

ARG CZ_VERSION=4.1.1
RUN pip install --no-cache-dir commitizen==$CZ_VERSION

ENTRYPOINT ["cz"]

CMD [ "version" ]
