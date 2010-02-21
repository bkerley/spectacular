require(File.join(File.dirname(__FILE__), 'test_helper.rb'))
class HelloWorldTest < Test::Unit::TestCase
  include Rack::Test::Methods

  def app
    Spectacular.new
  end

  def test_index_is_hello_world
    get '/'
    assert_equal 'hello world', last_response.body
  end
end
