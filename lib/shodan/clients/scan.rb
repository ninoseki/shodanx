# frozen_string_literal: true

# original author: Kent 'picat' Gruber

module Shodan
  module Clients
    class Scan < Base
      # Use this method to request Shodan to crawl a network.
      #
      # This method uses API scan credits: 1 IP consumes 1 scan credit. You
      # must have a paid API plan (either one-time payment or subscription)
      # in order to use this method.
      #
      # IP, IPs or netblocks (in CIDR notation) that should get crawled.
      def crawl(*ips)
        post("/shodan/scan", ips: ips.join(","))
      end

      # Use this method to request Shodan to crawl the Internet for a specific port.
      #
      # This method is restricted to security researchers and companies with
      # a Shodan Data license. To apply for access to this method as a researcher,
      # please email jmath@shodan.io with information about your project.
      # Access is restricted to prevent abuse.
      def crawl_for(**params)
        params[:query] = ""
        params = turn_into_query(params)
        post("/shodan/scan/internet", params)
      end

      # Check the progress of a previously submitted scan request.
      def get_by_id(id)
        get("/shodan/scan/#{id}")
      end
    end
  end
end
