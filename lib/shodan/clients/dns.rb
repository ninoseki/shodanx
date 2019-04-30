# frozen_string_literal: true

module Shodan
  module Clients
    class DNS < Base
      # Look up the IP address for the provided list of hostnames.
      def resolve(*hostnames)
        get("/dns/resolve", hostnames: hostnames.join(","))
      end

      # Look up the hostnames that have been defined for the
      # given list of IP addresses.
      def reverse(*ips)
        get("/dns/reverse", ips: ips.join(","))
      end
    end
  end
end
