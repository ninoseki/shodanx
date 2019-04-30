# frozen_string_literal: true

# original author: Kent 'picat' Gruber

require_relative "clients/base"

require_relative "clients/account"
require_relative "clients/alert"
require_relative "clients/dns"
require_relative "clients/host"
require_relative "clients/labs"
require_relative "clients/query"
require_relative "clients/scan"
require_relative "clients/tools"

require_relative "clients/rest"

require_relative "clients/exploits"

require "forwardable"

module Shodan
  class API
    extend Forwardable

    # @return [Shodan::Clients::Host]
    attr_reader :host

    # @return [Shodan::Clients::Query]
    attr_reader :query

    # @return [Shodan::Clients::DNS]
    attr_reader :dns

    # @return [Shodan::Clients::Tools]
    attr_reader :tools

    # @return [Shodan::Clients::Labs]
    attr_reader :labs

    # @return [Shodan::Clients::Alert]
    attr_reader :alert

    # @return [Shodan::Clients::Scan]
    attr_reader :scan

    # @return [Shodan::Clients::Account]
    attr_reader :account

    # @return [Shodan::Clients::Exploits]
    attr_reader :exploits

    def initialize(key: ENV.fetch("SHODAN_API_KEY", nil))
      raise ArgumentError, "No API key has been found or provided! (setup your SHODAN_API_KEY environment varialbe)" if key.nil?

      @account = Clients::Account.new(key: key)
      @alert = Clients::Alert.new(key: key)
      @dns = Clients::DNS.new(key: key)
      @host = Clients::Host.new(key: key)
      @labs = Clients::Labs.new(key: key)
      @query = Clients::Query.new(key: key)
      @scan = Clients::Scan.new(key: key)
      @tools = Clients::Tools.new(key: key)

      @rest = Clients::REST.new(key: key)

      @exploits = Clients::Exploits.new(key: key)
    end

    def_delegators :@rest, :ports, :protocols, :profile, :info
  end
end
