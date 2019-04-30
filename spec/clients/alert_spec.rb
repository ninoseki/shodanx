# frozen_string_literal: true

RSpec.describe Shodan::Clients::Alert, :vcr do
  let(:api ) { Shodan::API.new }

  describe "#get_by_id" do
    it do
      res = api.alert.get_by_id("GAMHXP3VXL0VS2FX")
      expect(res).to be_a(Hash)
    end
  end

  describe "#info" do
    it do
      res = api.alert.info
      expect(res).to be_an(Array)
    end
  end

  describe "#triggers" do
    it do
      res = api.alert.triggers
      expect(res).to be_an(Array)
    end
  end

  describe "#create" do
    it do
      res = api.alert.create(name: "Test alert", ip: "198.20.88.0/24")
      expect(res).to be_a(Hash)
    end
  end

  describe "#delete_by_id" do
    it do
      res = api.alert.delete_by_id("GAMHXP3VXL0VS2FX")
      expect(res).to be_a(Hash)
    end
  end
end
