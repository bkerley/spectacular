require(File.join(File.dirname(__FILE__), 'test_helper.rb'))
class TootTest < Test::Unit::TestCase
  context 'a toot' do
    setup do
      @toot = 'tooooooot'
      get "/#{@toot}"
    end

    should 'respond with an appropriate toot' do
      assert_match "<h1>#{@toot}</h1>", last_response.body
    end
  end
end
