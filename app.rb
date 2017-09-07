require 'sinatra'
require 'sinatra/base'

class App < Sinatra::Base
  get '/' do
    "Hello from sinatra! Wow!???!?? The time is #{ Time.now.to_i } on #{ `hostname` }!"
  end
end
