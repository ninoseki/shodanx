# frozen_string_literal: true

# original author: Kent 'picat' Gruber

require "shodan/version"
require "shodan/error"
require "shodan/api"

module Shodan
  def self.api
    API
  end
end
