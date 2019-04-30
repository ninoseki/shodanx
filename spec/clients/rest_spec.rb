# frozen_string_literal: true

RSpec.describe Shodan::Clients::REST, :vcr do
  let(:api) { Shodan::API.new }

  describe "#ports" do
    it do
      res = api.ports
      expect(res).to be_an(Array)
    end
  end

  describe "#protocols" do
    it do
      res = api.protocols
      expect(res).to be_a(Hash)
    end
  end

  describe "#info" do
    it do
      res = api.info
      expect(res).to be_a(Hash)
    end
  end
end
