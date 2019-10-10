FROM debian
RUN apt-get -y -q update --no-install-recommends \
 && apt-get -y -q install --no-install-recommends \
      bundler \
      fonts-linuxlibertine \
      inotify-tools \
      libcairo2-dev \
      libpango1.0-dev \
      pdftk \
      poppler-utils \
      ruby \
 && apt-get clean autoclean \
 && apt-get autoremove --yes \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/
RUN apt-get -y -q update --no-install-recommends \
 && apt-get -y -q install --no-install-recommends \
      ruby-dev \
 && apt-get clean autoclean \
 && apt-get autoremove --yes \
 && rm -rf /var/lib/{apt,dpkg,cache,log}/
COPY Gemfile /workspace/Gemfile
COPY Gemfile.lock /workspace/Gemfile.lock
WORKDIR /workspace
RUN bundle install 
COPY . /workspace
