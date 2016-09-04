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

COPY Gemfile Gemfile

RUN gem install bundler
RUN bundle install
RUN rm Gemfile

RUN mkdir -p /var/app
WORKDIR /var/app

CMD ["sh ./script/entrypoint.sh"]
