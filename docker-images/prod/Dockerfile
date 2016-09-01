FROM ruby:2.3.1-alpine

RUN apk --update add \
  postgresql-client \
  nodejs \
  git \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /var/app
WORKDIR /var/app

COPY . .


CMD ["./entrypoint.sh"]
