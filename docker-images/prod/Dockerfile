FROM ruby:2.3.1

# install primary dependencies
RUN apt-get update \
&& apt-get install -y --no-install-recommends \
  postgresql-client \
  apt-utils \
  libicu-dev \
  nodejs \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/app
WORKDIR /var/app

COPY . .

RUN gem install bundler
RUN cd /var/app && bundle install

CMD ["./entrypoint.sh"]
