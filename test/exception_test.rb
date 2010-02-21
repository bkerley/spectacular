require(File.join(File.dirname(__FILE__), 'test_helper.rb'))

class ExceptionTest < Test::Unit::TestCase
  context 'A failed request' do
    setup do
      app.instance_variable_get('@dispatcher').expects(:dispatch).raises(StandardError, 'exception test error')
      get '/exception_test'
    end

    should 'return the message of the exception' do
      assert_match 'exception test error', last_response.body
    end

    should 'return environment information' do
      assert_match 'REQUEST_METHOD: GET', last_response.body
      assert_match 'PATH_INFO: /exception_test', last_response.body
    end
  end
end
