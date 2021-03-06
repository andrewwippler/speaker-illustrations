FROM ruby:2.4
LABEL maintainer="Andrew Wippler <andrew.wippler@gmail.com>"

ENV RAILS_ENV=production \
    SECRET_KEY_BASE=xptod \
    RAILS_DB=speaker_illus \
    RAILS_DB_USER=user \
    RAILS_DB_PASS=pass \
    RAILS_REDIS=redis \
    RAILS_REDIS_CHAN=SpeakerIllustrations_prod

RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get update && \
    apt-get install -y \
        postgresql-client \
        nodejs \
        && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
ADD . .

RUN gem update bundler --pre && \
    bundle install && \
    RAILS_GROUPS=assets bundle exec rake assets:precompile