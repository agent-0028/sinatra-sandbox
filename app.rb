require 'sinatra/base'
require_relative 'models'

class App < Sinatra::Base
  get '/' do
    @episodes = Sinatra::App::Models::Episode.all
    "Hello from sinatra! Wow!???!?? The time is #{ Time.now.to_i } on #{ `hostname` }! #{ @episodes[0][:title] }"
  end
end
