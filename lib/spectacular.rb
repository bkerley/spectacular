class Spectacular
  def call(environment)
    [ 200, { 'Content-type' => 'text/plain'}, 'hello world']
  end
end
