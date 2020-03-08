# frozen_string_literal: true

# original author: Kent 'picat' Gruber

module Shodan
  module Clients
    class Query < Base
      # Use this method to obtain a list of search queries that users have saved in Shodan.
      def list(**params)
        get("/shodan/query", **params)
      end

      # Use this method to search the directory of search queries that users have saved in Shodan.
      def search(query, **params)
        params[:query] = query
        params = turn_into_query(params)
        get("/shodan/query/search", **params)
      end

      # Use this method to obtain a list of popular tags for the saved search queries in Shodan.
      def tags(size = 10)
        params = {}
        params[:size] = size
        get("/shodan/query/tags", **params)
      end
    end
  end
end
