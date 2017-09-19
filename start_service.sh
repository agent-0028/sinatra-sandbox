#!/usr/bin/env bash

if [ ! -r podcast.db ]; then
  ruby migrate.rb
fi

bundle exec rackup config.ru -p 80 -s thin -o 0.0.0.0