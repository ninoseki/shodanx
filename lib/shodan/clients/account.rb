# frozen_string_literal: true

module Shodan
  module Clients
    class Account < Base
      # Returns information about the Shodan account linked to this API key.
      def profile
        get("/account/profile")
      end
    end
  end
end
