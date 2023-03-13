FROM python:3-alpine

WORKDIR /app

# Add dependencies
RUN apk add --update -t --no-cache git curl alpine-sdk
RUN ["pip", "install", "-U", "--no-cache-dir", "pip"]

ARG CZ_VERSION=2.28.0
RUN pip install --no-cache-dir commitizen==$CZ_VERSION

ENTRYPOINT ["cz"]

CMD [ "version" ]
