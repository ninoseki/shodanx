# frozen_string_literal: true

RSpec.describe Shodan::Clients::DNS, :vcr do
  let(:api ) { Shodan::API.new }

  describe "#resolve" do
    it do
      res = api.dns.resolve("google.com")
      expect(res).to be_a(Hash)
    end
  end

  describe "#reverse" do
    it do
      res = api.dns.reverse("1.1.1.1")
      expect(res).to be_a(Hash)
    end
  end
end
