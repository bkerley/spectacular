require 'cgi'
require 'haml'
%w{ dispatcher controller app }.each do |f|
  require File.join(File.dirname(__FILE__), "spectacular/#{f}.rb")
end

APP_DIR = File.join(File.dirname(__FILE__), '../app')
