FROM python:3-alpine

WORKDIR /app

# Add dependencies
RUN apk add --update -t --no-cache git curl alpine-sdk

RUN ["pip", "install", "commitizen>=2,<3"]

CMD [ "cz version" ]