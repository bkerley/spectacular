module Spectacular
  class App
    def initialize
      @dispatcher = Dispatcher.new
    end
    def call(environment)
      method = environment['REQUEST_METHOD']
      path = environment['PATH_INFO']
      @dispatcher.dispatch
    rescue => e
      error_backtrace e
    end

    private
    def error_backtrace(exception)
      exception_info = []
      exception_info << <<-EOS
        <html><head><title>Spectacular Exception</title></head><body>
        <h1>Spectacular Exception</h1>
        <h2>#{CGI.escapeHTML exception.to_s}</h2>
        <ol>
      EOS
      exception_info += exception.backtrace.map{ |e| "<li>#{CGI.escapeHTML e.to_s}</li>"}
      exception_info << <<-EOS
        </ol></body></html>
      EOS

      [500, { 'Content-type' => 'text/html'}, exception_info]
    end
  end
end
