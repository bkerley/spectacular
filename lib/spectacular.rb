require 'cgi'
%w{ dispatcher controller app }.each do |f|
  require File.join(File.dirname(__FILE__), "spectacular/#{f}.rb")
end
