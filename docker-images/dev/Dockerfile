FROM ruby:2.2.2

RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    apt-utils \
    libicu-dev \
    nodejs \
    git \
    postgresql-client \
  && rm -rf /var/lib/apt/lists/*

COPY Gemfile ./Gemfile
COPY Gemfile.lock ./Gemfile.lock

RUN gem install bundler

RUN bundle install

WORKDIR /var/app

CMD ["./entrypoint.sh"]
