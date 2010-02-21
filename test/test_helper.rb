require 'rubygems'
require 'test/unit'
require 'rack/test'

require File.join(File.dirname(__FILE__), '../lib/spectacular.rb')

class Test::Unit::TestCase
  def app
    Spectacular::App.new
  end
end
