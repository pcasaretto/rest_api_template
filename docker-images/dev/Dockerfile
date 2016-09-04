FROM ruby:2.3.1

# install primary dependencies
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
  postgresql-client \
  apt-utils \
  libicu-dev \
  nodejs \
&& rm -rf /var/lib/apt/lists/*

COPY Gemfile Gemfile

RUN gem install bundler
RUN bundle install
RUN rm Gemfile

RUN mkdir -p /var/app
WORKDIR /var/app
