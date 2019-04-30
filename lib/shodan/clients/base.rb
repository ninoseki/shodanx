# frozen_string_literal: true

module Shodan
  module Clients
    class Base
      # The path to the REST API endpoint.
      HOST = "api.shodan.io"
      BASE_URL = "https://#{HOST}"

      attr_reader :key

      def initialize(key: ENV["SHODAN_API_KEY"])
        @key = key
        warn 'No key has been found or provided!' unless key?
      end

      def key?
        !key.nil?
      end

      private

      def _host
        self.class::HOST
      end

      def base_url
        self.class::BASE_URL
      end

      def request(req)
        Net::HTTP.start(_host, 443, https_options) do |http|
          response = http.request(req)

          if response.code.to_i != 200
            json = JSON.parse(response.body)
            raise Error, json["error"] if json.key?("error")

            raise Error, response.body
          end
          JSON.parse response.body
        end
      end

      # Perform a direct GET HTTP request to the REST API.
      def get(path, **params)
        params[:key] = key

        uri = URI("#{base_url}#{path}")
        uri.query = URI.encode_www_form(params)
        req = Net::HTTP::Get.new(uri)
        request req
      end

      # Perform a direct POST HTTP request to the REST API.
      def post(path, **params)
        uri = URI("#{base_url}#{path}?key=#{key}")
        req = Net::HTTP::Post.new(uri)
        req.content_type = "application/json"
        req.body = params.to_json

        request req
      end

      # Perform a direct DELETE HTTP request to the REST API.
      def delete(path, **params)
        params[:key] = key

        uri = URI("#{base_url}#{path}")
        uri.query = URI.encode_www_form(params)
        req = Net::HTTP::Delete.new(uri)
        request req
      end

      def https_options
        if proxy = ENV["HTTPS_PROXY"] || ENV["https_proxy"]
          uri = URI(proxy)
          {
            proxy_address: uri.hostname,
            proxy_port: uri.port,
            proxy_from_env: false,
            use_ssl: true
          }
        else
          { use_ssl: true }
        end
      end

      def turn_into_query(params)
        query = params.dig(:query)
        options = params.reject { |k, _| k == :query }.map { |k, v| "#{k}:#{v}" }
        {
          query: [query, options].flatten.compact.join(" ")
        }
      end

      def turn_into_facets(facets)
        {
          facets: facets.map { |k, v| "#{k}:#{v}" }.join(",")
        }
      end
    end
  end
end
