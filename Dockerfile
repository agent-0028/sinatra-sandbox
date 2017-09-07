FROM ruby:2.3.1-slim
RUN apt-get update -qq && apt-get install -y build-essential

ENV APP_ROOT /var/www/docker-sinatra
RUN mkdir -p $APP_ROOT
WORKDIR $APP_ROOT
ADD Gemfile $APP_ROOT/
ADD Gemfile.lock $APP_ROOT/
RUN gem install bundler && bundle install
ADD . $APP_ROOT

EXPOSE 80
