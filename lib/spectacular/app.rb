
module Spectacular
  class App
    def call(environment)
      [ 200, { 'Content-type' => 'text/plain'}, 'hello world']
    end
  end
end
