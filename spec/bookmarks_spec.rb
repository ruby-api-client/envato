# frozen_string_literal: true

require "spec_helper"
require "envato"

RSpec.describe "#bookmarks.list" do
  subject(:resp) do
    VCR.use_cassette("bookmarks_list") do
      @envato.bookmarks.list
    end
  end

  it { expect(resp).to be_instance_of(Envato::Collection) }
  it { expect(resp.data.first).to be_instance_of(Envato::UserBookmark) }
end
