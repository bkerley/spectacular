require(File.join(File.dirname(__FILE__), 'test_helper.rb'))
class HelloWorldTest < Test::Unit::TestCase
  def test_index_is_hello_world
    get '/'
    assert_match 'hello world', last_response.body
  end
end
