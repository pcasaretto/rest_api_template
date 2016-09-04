FROM ruby:2.3.1-alpine

RUN apk --update add \
  postgresql-client \
  postgresql-dev \
  nodejs \
  git \
  build-base \
  ruby-dev \
  libc-dev \
  linux-headers \
  openssl-dev \
  libxml2-dev \
  libxslt-dev \
  && rm -rf /var/cache/apk/*

RUN mkdir -p /var/app
WORKDIR /var/app

COPY Gemfile Gemfile

RUN gem install bundler
RUN cd /var/app && bundle install

CMD ["./entrypoint.sh"]
