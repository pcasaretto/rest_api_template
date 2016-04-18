# sudo docker build -t "resultadosdigitais/API_NAME_HERE-dev:alpha" -f docker-images/API_NAME_HERE-dev .

FROM ruby:2.2.2

# see update.sh for why all "apt-get install"s have to stay as one long line
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

RUN bundle install

WORKDIR /var/app
