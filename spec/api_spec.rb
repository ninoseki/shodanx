# frozen_string_literal: true

RSpec.describe Shodan::API do
  describe "#initialize" do
    context "when not given a key" do
      before { allow(ENV).to receive(:fetch).with("SHODAN_API_KEY", nil).and_return(nil) }

      it do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end
end
