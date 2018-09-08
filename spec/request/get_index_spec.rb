ENV['RACK_ENV'] = 'test'

require_relative '../../app'
require 'rspec'
require 'rack/test'
require 'spec_helper'

describe 'LunaCast Podcast App' do
  def app
    App
  end

  it "says hello...wow" do
    get '/'
    expect(last_response).to be_ok
    expect(last_response.body).to include('Hello from sinatra! Wow!')
  end
end
