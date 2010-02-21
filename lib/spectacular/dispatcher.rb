module Spectacular
  class Dispatcher
    def initialize
      load_controllers
      load_routes
    end

    def dispatch(method, path, environment)
      matched_path, controller, method = get_route path
      controller_instance = controller.new(method, path, environment)
      controller_instance.response
    end

    private
    def load_controllers
      controller_files = Dir.glob(File.join(APP_DIR, 'controllers', '*_controller.rb'))
      controller_files.each { |f| require f }
    end

    def load_routes
      route_filename = File.join(APP_DIR, 'routes.rb')
      route_data = File.read(route_filename)
      route_pen = RoutePen.new
      eval route_data, route_pen.get_binding, route_filename
      @routes = route_pen.to_a
    end

    def get_route(path)
      @routes.detect{ |r| r[0] === path }
    end

    class RoutePen
      def initialize
        @routes = []
      end

      def get_binding
        binding
      end

      def route(path, controller, method)
        @routes << [path, controller, method]
      end

      def to_a
        @routes
      end
    end
  end
end
