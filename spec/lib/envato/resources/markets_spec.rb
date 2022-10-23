# frozen_string_literal: true

require "spec_helper"
require "envato"

RSpec.describe "#markets.total_items" do
  subject(:resp) do
    VCR.use_cassette("market_total_items") do
      @envato.markets.total_items
    end
  end

  it { expect(resp["total-items"].total_items).to eq("12743594") }
end
