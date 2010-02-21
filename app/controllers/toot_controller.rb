class TootController < Spectacular::Controller
  def toot
    @toot = @path.gsub('/','')
  end
end
