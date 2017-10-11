require 'sinatra/base'
require 'sinatra/reloader'
require_relative 'models'

class App < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    # also_reload '/path/to/some/file'
    # dont_reload '/path/to/other/file'
    after_reload do
      puts 'reloaded'
    end
  end

  get '/' do
    puts ENV['RACK_ENV']
    @episodes = Sinatra::App::Models::Episode.all
    "Hello from sinatra! Wow! The time is #{ Time.now.to_i } on #{ `hostname` }! #{ @episodes[0][:title] }"
  end
end
