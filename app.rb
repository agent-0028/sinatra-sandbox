require 'sinatra/base'
require 'sequel'

DB = Sequel.connect('sqlite://podcast.db')

class Episode < Sequel::Model; end

class App < Sinatra::Base
  get '/' do
    @episodes = Episode.all
    "Hello from sinatra! Wow!???!?? The time is #{ Time.now.to_i } on #{ `hostname` }! #{ @episodes[0][:title] }"
  end
end
