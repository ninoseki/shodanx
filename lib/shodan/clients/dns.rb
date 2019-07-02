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

      # Get all the subdomains and other DNS entries for the given domain. Uses 1 query credit per lookup.
      def domain(domain)
        get("/dns/domain/#{domain}")
      end
    end
  end
end
