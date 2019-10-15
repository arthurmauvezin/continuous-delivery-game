FROM ruby:2.4.9-slim-stretch

RUN apt-get -y -q update --no-install-recommends \
 && apt-get -y -q install --no-install-recommends \
      gcc \
      libcairo2-dev \
      make \
      pdftk \
      poppler-utils \
 && apt-get clean autoclean \
 && apt-get autoremove --yes \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .
