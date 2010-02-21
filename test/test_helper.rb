require 'rubygems'
require 'test/unit'
require 'rack/test'
require 'mocha'
require 'shoulda'

require File.join(File.dirname(__FILE__), '../lib/spectacular.rb')

class Test::Unit::TestCase
  include Rack::Test::Methods
  def app
    @app ||= Spectacular::App.new
  end
end
