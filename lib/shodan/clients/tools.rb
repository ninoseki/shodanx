# frozen_string_literal: true

module Shodan
  module Clients
    class Tools < Base
      # Shows the HTTP headers that your client sends when
      # connecting to a webserver.
      def http_headers
        get("/tools/httpheaders")
      end

      # Get your current IP address as seen from the Internet.
      def my_ip
        get("/tools/myip")
      end
    end
  end
end
