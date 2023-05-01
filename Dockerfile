FROM python:3-alpine

WORKDIR /app

# Add dependencies
RUN apk add --update -t --no-cache git curl alpine-sdk
RUN ["pip", "install", "-U", "--no-cache-dir", "pip"]

ARG CZ_VERSION=3.1.1
RUN pip install --no-cache-dir commitizen==$CZ_VERSION

ENTRYPOINT ["cz"]

CMD [ "version" ]
