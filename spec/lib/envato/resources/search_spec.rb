# frozen_string_literal: true

require "spec_helper"
require "envato"

RSpec.describe "#search.more_like_this" do
  context "with item_id param" do
    subject(:resp) do
      VCR.use_cassette("search_more_like_this") do
        @envato.search.more_like_this(item_id: "5556590")
      end
    end

    it { expect(resp).to be_instance_of(Envato::Collection) }
    it { expect(resp.data.first).to be_instance_of(Envato::Item) }
  end
end

RSpec.describe "#search.comments" do
  context "with item_id param" do
    subject(:resp) do
      VCR.use_cassette("search_comments") do
        @envato.search.comments(item_id: "5556590")
      end
    end

    it { expect(resp).to be_instance_of(Envato::Collection) }
    it { expect(resp.data.first).to be_instance_of(Envato::Comment) }
  end
end

RSpec.describe "#search.item" do
  subject(:resp) do
    VCR.use_cassette("search_item") do
      @envato.search.item
    end
  end

  it { expect(resp).to be_instance_of(Envato::Collection) }
  it { expect(resp.data.first).to be_instance_of(Envato::Item) }
end
