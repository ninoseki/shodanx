# frozen_string_literal: true

module Shodan
  module Clients
    class Labs < Base
      # Calculates a honeypot probability score ranging
      # from 0 (not a honeypot) to 1.0 (is a honeypot).
      def honeyscore(ip)
        get("/labs/honeyscore/#{ip}")
      end
    end
  end
end
