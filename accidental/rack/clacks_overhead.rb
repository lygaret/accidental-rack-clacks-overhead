module Accidental
  module Rack

    # "A man is not dead while his name is still spoken." - Terry Pratchett
    # https://xclacksoverhead.org/home/about
    class ClacksOverhead

      HEADER = "X-Clacks-Overhead".freeze

      def initialize(app, *names)
        @app      = app
        @overhead = "GNU #{names.join(", ")}".freeze
      end

      def call(env)
        result = @app.call(env)
        result[1][HEADER] ||= @overhead
        result
      end

    end
  end
end
