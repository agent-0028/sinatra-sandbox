require 'sinatra/base'
require 'sinatra/reloader'
require "sinatra/json"
require_relative 'models'
require_relative 'services'

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
    environment = ENV['RACK_ENV']
    @episodes = Sinatra::App::Models::Episode.all
    thing = Sinatra::App::Services.thing
    header = <<-HEADER
The time is #{ Time.now.to_i } on #{ `hostname` }!<br/>
#{ environment }<br>
#{ thing }<br>
HEADER
    episode_string = ''
    @episodes.each do |episode|
      # TODO: Switch this to a template, this string concat crap sucks
      episode_string.concat(episode[:title])
      episode_string.concat(': ')
      episode_string.concat(episode[:datetime].strftime('%F'))
      episode_string.concat("<br>\n")
    end
    header.concat(episode_string)
  end

  post '/' do
    "sdsdsdsd"
  end
end
