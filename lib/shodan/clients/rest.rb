# frozen_string_literal: true

# original author: Kent 'picat' Gruber

module Shodan
  module Clients
    class REST < Base
      # This method returns a list of port numbers that the crawlers are looking for.
      def ports
        get("/shodan/ports")
      end

      # List all protocols that can be used when performing on-demand Internet scans via Shodan.
      def protocols
        get("/shodan/protocols")
      end

      # Returns information about the API plan belonging to the given API key.
      def info
        get("/api-info")
      end
    end
  end
end
