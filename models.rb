require "sequel"

DB = Sequel.connect("sqlite://podcast.db")

module Sinatra
  module App
    module Models
      class Episode < Sequel::Model; end
    end
  end
end
