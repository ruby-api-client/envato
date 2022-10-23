# frozen_string_literal: true

require "spec_helper"
require "envato"

RSpec.describe "#item.info" do
  context "with id param" do
    subject(:resp) do
      VCR.use_cassette("item_info") do
        @envato.item.info(id: "5556590")
      end
    end

    it { expect(resp).to be_an(Envato::Item) }
    it { expect(resp.tags).to be_an(Array) }
    it { expect(resp.attributes).to be_an(Array) }
    it { expect(resp.previews).to be_an(OpenStruct) }
    it { expect(resp.site).to eq("themeforest.net") }
  end

  context "without id param" do
    subject(:resp) do
      VCR.use_cassette("item_info") do
        @envato.item.info
      end
    end

    it { expect { resp }.to raise_error(ArgumentError) }
  end
end

RSpec.describe "#item.version" do
  context "with id param" do
    subject(:resp) do
      VCR.use_cassette("item_version") do
        @envato.item.version(id: "5556590")
      end
    end

    it { expect(resp).to be_instance_of(Envato::ItemVersion) }
  end

  context "without id param" do
    subject(:resp) do
      VCR.use_cassette("item_version") do
        @envato.item.version
      end
    end

    it { expect { resp }.to raise_error(ArgumentError) }
  end
end

RSpec.describe "#item.prices" do
  context "with id param" do
    subject(:resp) do
      VCR.use_cassette("item_prices") do
        @envato.item.prices(item_id: "5556590")
      end
    end

    it { expect(resp).to be_instance_of(Envato::Collection) }
    it { expect(resp.data.first).to be_instance_of(Envato::ItemPrice) }
  end

  context "without id param" do
    it { expect { @envato.item.prices }.to raise_error(ArgumentError, /missing keyword/) }
  end
end

RSpec.describe "#item.purchases" do
  subject(:resp) do
    VCR.use_cassette("item_purchases") do
      @envato.item.purchases
    end
  end

  it { expect(resp).to be_instance_of(Envato::Collection) }
end

RSpec.describe "#item.list_purchases" do
  subject(:resp) do
    VCR.use_cassette("item_list_purchases") do
      @envato.item.list_purchases
    end
  end

  it { expect(resp).to be_instance_of(Envato::Collection) }
  it { expect(resp.data.count).to be_instance_of(Integer) }
end
