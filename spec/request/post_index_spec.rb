ENV['RACK_ENV'] = 'test'

require_relative '../../app'
require 'rspec'
require 'rack/test'
require 'spec_helper'

describe 'LunaCast Podcast App' do
  def app
    App
  end

  it "accepts a post without error" do
    post '/'
    expect(last_response).to be_ok
  end
end
