# frozen_string_literal: true

require "spec_helper"
require "envato"

RSpec.describe Envato::Client do
  context "with valid token" do
    describe "#user", :vcr do
      it "name" do
        allow(@envato.user)
          .to receive(:name)
          .and_return(Envato::UserResource)
      end
    end
  end

  context "without token" do
    it do
      expect { described_class.new }.to raise_error(ArgumentError)
    end
  end
end

RSpec.describe "#VERSION" do
  it { expect(Envato::VERSION).to eq "1.0.1" }
end
