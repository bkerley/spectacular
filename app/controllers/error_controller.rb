class ErrorController < Spectacular::Controller
  def not_found
    @response_code = 404
  end
end
