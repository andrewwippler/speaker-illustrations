FROM ruby:2.4.3

ENV RAILS_ENV production
ENV SECRET_KEY_BASE xpto

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && \
    apt-get install -y \
        postgresql-client \
        nodejs \
        && \
    apt-get dist-upgrade -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && rm -rf /var/lib/apt/lists/*

WORKDIR /app
ADD . .

RUN gem update bundler --pre
RUN bundle install --without development test

RUN RAILS_GROUPS=assets bundle exec rake assets:precompile