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

RUN groupadd -g 1000 -r ruby \
 && useradd --no-log-init -u 1000 -r -g ruby ruby

WORKDIR /home/ruby/app

COPY --chown=ruby:ruby Gemfile Gemfile.lock ./
RUN bundle install

COPY --chown=ruby:ruby . .

USER ruby

ENTRYPOINT ["rake", "verso"]

