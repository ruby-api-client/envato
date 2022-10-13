# frozen_string_literal: true

require "spec_helper"
require "envato"

RSpec.describe "#market.categories" do
  context "when site is themeforest" do
    subject(:resp) do
      VCR.use_cassette("market_categories_themeforest") do
        @envato.market.categories site: "themeforest"
      end
    end

    it { expect(resp).to be_instance_of(Envato::Collection) }
    it { expect(resp.data.first).to be_instance_of(Envato::Category) }
    it { expect(resp.data.first.name).to eq "Site Templates" }
    it { expect(resp.data.first.path).to eq "site-templates" }
  end

  context "when site is graphicriver" do
    subject(:resp) do
      VCR.use_cassette("market_categories_graphicriver") do
        @envato.market.categories_graphicriver
      end
    end

    it { expect(resp).to be_instance_of(Envato::Collection) }
    it { expect(resp.data.first).to be_instance_of(Envato::Category) }
    it { expect(resp.data.first.name).to eq "Graphics" }
    it { expect(resp.data.first.path).to eq "graphics" }
  end
end

RSpec.describe "#market.features" do
  context "when site is themeforest" do
    subject(:resp) do
      VCR.use_cassette("market_features_themeforest") do
        @envato.market.features site: "themeforest"
      end
    end

    # TODO: Object to Features
    it { expect(resp).to be_an(Envato::Object) }
    it { expect(resp.features.free_file).to be_an OpenStruct }
    it { expect(resp.features.featured_file).to be_an OpenStruct }
    it { expect(resp.features.featured_author).to be_an OpenStruct }
  end

  context "when site is graphicriver" do
    subject(:resp) do
      VCR.use_cassette("market_features_graphicriver") do
        @envato.market.features_graphicriver
      end
    end

    it { expect(resp).to be_instance_of(Envato::Object) }
    it { expect(resp.features.free_file).to be_an OpenStruct }
    it { expect(resp.features.featured_file).to be_an OpenStruct }
    it { expect(resp.features.featured_author).to be_an OpenStruct }
  end
end

RSpec.describe "#market.new_files" do
  context "when site is themeforest" do
    subject(:resp) do
      VCR.use_cassette("market_new_files") do
        @envato.market.new_files(site: "themeforest", category: "site-templates")
      end
    end

    it { expect(resp).to be_instance_of(Envato::Collection) }
    it { expect(resp.data.first).to be_an OpenStruct }
  end

  context "when site is graphicriver" do
    context "ant category is graphics" do
      subject(:resp) do
        VCR.use_cassette("market_new_files_graphicriver_graphics") do
          @envato.market.new_files_graphicriver category: "graphics"
        end
      end

      it { expect(resp).to be_instance_of(Envato::Collection) }
      it { expect(resp.data.first).to be_an OpenStruct }
    end
  end
end

RSpec.describe "#market.popular_items" do
  subject(:resp) do
    VCR.use_cassette("market_popular_items_themeforest") do
      @envato.market.popular_items site: "themeforest"
    end
  end

  it { expect(resp).to be_instance_of(Envato::Object) }
  it { expect(resp.popular).to be_instance_of(OpenStruct) }
  it { expect(resp.popular.items_last_week).to be_instance_of(Array) }
  it { expect(resp.popular.items_last_week.first.id).not_to be(nil) }
end
