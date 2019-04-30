# frozen_string_literal: true

RSpec.describe Shodan::Clients::Query, :vcr do
  let(:api) { Shodan::API.new }

  describe "#list" do
    it do
      res = api.query.list
      expect(res).to be_a(Hash)
    end
  end

  describe "#search" do
    it do
      res = api.query.search("nginx")
      expect(res).to be_a(Hash)
    end
  end

  describe "#tags" do
    it do
      res = api.query.tags
      expect(res).to be_a(Hash)
    end
  end
end
