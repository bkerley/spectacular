require 'lib/spectacular.rb'
use Rack::ContentLength

run(Spectacular::App.new)
