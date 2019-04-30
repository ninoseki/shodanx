# frozen_string_literal: true

RSpec.describe Shodan::Clients::Account, :vcr do
  let(:api ) { Shodan::API.new }

  describe "#profile" do
    it do
      res = api.account.profile
      expect(res).to be_a(Hash)
    end
  end
end
