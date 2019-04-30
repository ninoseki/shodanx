# frozen_string_literal: true

module Shodan
  module Clients
    class Alert < Base
      def create(name:, ip:)
        params = {
          name: name,
          filters: {
            ip: ip
          }
        }
        post("/shodan/alert", params)
      end

      def delete_by_id(id)
        delete("/shodan/alert/#{id}")
      end

      def get_by_id(id)
        get("/shodan/alert/#{id}/info")
      end

      def info
        get("/shodan/alert/info")
      end

      def triggers
        get("/shodan/alert/triggers")
      end
    end
  end
end
