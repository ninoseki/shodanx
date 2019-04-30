# frozen_string_literal: true

RSpec.describe Shodan::Clients::Labs, :vcr do
  let(:api) { Shodan::API.new }

  describe "#honeyscore" do
    it do
      res = api.labs.honeyscore("34.80.158.52")
      expect(res).to be_a(Float)
    end
  end
end
