ENV['RACK_ENV'] = 'test'

require_relative '../../services'
require 'rspec'
require 'spec_helper'

describe 'Thing' do
  it "does a thing" do
    result = Sinatra::App::Services.thing
    expect(result).to eq 'woot'
  end
end
