# frozen_string_literal: true

RSpec.describe Shodan::Clients::Scan, :vcr do
  let(:api) { Shodan::API.new }

  describe "#crawl" do
    it do
      res = api.scan.crawl("113.197.211.196")
      expect(res).to be_a(Hash)
    end
  end

  describe "#get_by_id" do
    it do
      res = api.scan.get_by_id("xRAxRMkMQk5QXuJB")
      expect(res).to be_a(Hash)
    end
  end
end
