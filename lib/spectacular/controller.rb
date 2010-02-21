module Spectacular
  class Controller
    def response_for(method)
      @method = method
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
      @body = engine.render
    end

    def template_file
      File.join(APP_DIR, 'views', controller_name, "#{@method}.html.haml")
    end

    def controller_name
      self.class.to_s.gsub(/Controller/, '').downcase
    end
  end
end
