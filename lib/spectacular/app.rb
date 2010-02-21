module Spectacular
  class App
    def initialize
      @dispatcher = Dispatcher.new
    end
    def call(environment)
      method = environment['REQUEST_METHOD']
      path = environment['PATH_INFO']
      @dispatcher.dispatch method, path, environment
    rescue => exception
      error_backtrace exception, environment
    end

    private
    def error_backtrace(exception, environment)
      exception_info = []
      exception_info << <<-EOS
        <html><head><title>Spectacular Exception</title></head><body>
        <h1>Spectacular Exception</h1>
        <h2>#{escape exception}</h2>
        <h3>Traceback</h3>
        <ol>
      EOS
      exception_info += exception.backtrace.map{ |e| "<li>#{escape e}</li>"}
      exception_info << <<-EOS
        </ol>
        <h3>Environment</h3>
        <ul>
      EOS
      exception_info += environment.to_a.map{ |e| "<li>#{escape e[0]}: #{escape e[1]}</li>"}
      exception_info << <<-EOS
        </body></html>
      EOS

      [500, { 'Content-type' => 'text/html'}, exception_info]
    end

    def escape(string)
      CGI.escapeHTML string.to_s
    end
  end
end
