FROM ruby:2.6.3-alpine3.9

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
    build-base \
    libxml2-dev \
    libxslt-dev \
    mongodb \
    tzdata \
    bash \
    curl \
    git \
    ffmpeg \
    less

ENV RAILS_ROOT /var/www/video_trim

RUN gem install bundler

RUN mkdir -p $RAILS_ROOT && mkdir -p $RAILS_ROOT/tmp/pids
WORKDIR $RAILS_ROOT

COPY Gemfile* ./

RUN bundle config build.nokogiri --use-system-libraries

RUN bundle install --jobs 20 --retry 5

COPY . .

# RUN bin/rake assets:precompile

RUN addgroup -g 1000 -S www-data && adduser -u 1000 -S www-data -G www-data

RUN chown -R www-data:www-data /var/www
RUN chmod +x entrypoint.sh

USER www-data
