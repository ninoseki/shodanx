# frozen_string_literal: true

RSpec.describe Shodan::Clients::Tools, :vcr do
  let(:api) { Shodan::API.new }

  describe "#http_headers" do
    it do
      res = api.tools.http_headers
      expect(res).to be_a(Hash)
    end
  end

  describe "#my_ip" do
    it do
      res = api.tools.my_ip
      expect(res).to be_a(String)
    end
  end
end
