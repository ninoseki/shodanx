# frozen_string_literal: true

# original author: Kent 'picat' Gruber

module Shodan
  module Clients
    class Host < Base
      # Returns all services that have been found on the given host IP.
      # @param ip [String]
      # @option params [Hash]
      # @return [Hash]
      def get_by_ip(ip, **params)
        get("/shodan/host/#{ip}", params)
      end

      # This method behaves identical to "/shodan/host/search" with the only
      # difference that this method does not return any host results, it only
      # returns the total number of results that matched the query and any
      # facet information that was requested. As a result this method does
      # not consume query credits.
      def count(query = "", facets: {}, **params)
        params[:query] = query
        converted_params = turn_into_query(params)
        facets = turn_into_facets(facets)
        get("/shodan/host/count", converted_params.merge(facets))
      end

      # Search Shodan using the same query syntax as the website and use facets
      # to get summary information for different properties.
      def search(query = "", facets: {}, page: 1, minify: true, **params)
        params[:query] = query
        params = turn_into_query(params)
        facets = turn_into_facets(facets)
        params[:page] = page
        params[:minify] = minify
        get("/shodan/host/search", params.merge(facets))
      end

      # This method lets you determine which filters are being used by
      # the query string and what parameters were provided to the filters.
      def tokens(query = "", **params)
        params[:query] = query
        params = turn_into_query(params)
        get("/shodan/host/search/tokens", params)
      end
    end
  end
end
