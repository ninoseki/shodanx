# frozen_string_literal: true

RSpec.describe Shodan::Clients::Host, :vcr do
  let(:api ) { Shodan::API.new }

  describe "#get_by_ip" do
    it do
      res = api.host.get_by_ip("104.25.89.97")
      expect(res.dig("ip_str")).to eq("104.25.89.97")
    end
  end

  describe "#count" do
    it do
      res = api.host.count("nginx")
      expect(res.dig("total")).to be_a(Integer)
    end

    context "with facets" do
      it do
        res = api.host.count("nginx", facets: { country: 10 })
        expect(res.dig("facets")).to be_a(Hash)
      end
    end
  end

  describe "#search" do
    it do
      res = api.host.search("nginx")
      expect(res).to be_a(Hash)
    end

    context "with facets" do
      it do
        res = api.host.search("ftp", port: 21, facets: { country: 10 })
        expect(res.dig("facets")).to be_a(Hash)
      end
    end
  end

  describe "#tokens" do
    it do
      res = api.host.tokens("nginx")
      expect(res).to be_a(Hash)
    end
  end
end
