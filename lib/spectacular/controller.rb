module Spectacular
  class Controller
    def initialize(method, path, environment)
      @method = method
      @path = path
      @params = Rack::Utils.parse_query(environment['QUERY_STRING'])
      @posted = Rack::Utils.parse_query(environment['rack.input'].read)
      @environment = environment
    end
    def response
      send @method
      [response_code, headers, body]
    end

    private
    def response_code
      @response_code || 200
    end

    def headers
      @headers || { 'Content-type' => 'text/html' }
    end

    def body
      return @body if defined? @body
      template = File.read template_file
      engine = Haml::Engine.new template
      @body = engine.render binding
    end

    def template_file
      File.join(APP_DIR, 'views', controller_name, "#{@method}.html.haml")
    end

    def controller_name
      self.class.to_s.gsub(/Controller/, '').downcase
    end
  end
end
