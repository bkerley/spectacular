require(File.join(File.dirname(__FILE__), 'test_helper.rb'))

class ExceptionTest < Test::Unit::TestCase
  context 'A failed request' do
    setup do
      app.instance_variable_get('@dispatcher').expects(:dispatch).raises(StandardError, 'exception test error')
      get '/'
    end

    should 'return the message of the exception' do
      assert_match 'exception test error', last_response.body
    end
  end
end
