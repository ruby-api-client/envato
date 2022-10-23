# frozen_string_literal: true

require "spec_helper"
require "envato"

RSpec.describe "#user.name" do
  subject(:resp) do
    VCR.use_cassette("user_name") do
      @envato.user.name
    end
  end

  it { expect(resp.username).to eq("collis") }
end

RSpec.describe "#user.email" do
  subject(:resp) do
    VCR.use_cassette("user_email") do
      @envato.user.email
    end
  end

  it { expect(resp.email).to eq("email@example.com") }
end

RSpec.describe "#user.badges" do
  context "when user exists" do
    subject(:resp) do
      VCR.use_cassette("user_badges") do
        @envato.user.badges username: "collis"
      end
    end

    it { expect(resp).to be_instance_of Envato::Collection }
    it { expect(resp.data.first).to be_instance_of Envato::UserBadge }
    it { expect(resp.data.first.name).to be_instance_of String }
    it { expect(resp.data.first.label).to be_instance_of String }
    it { expect(resp.data.first.image).to be_instance_of String }
  end

  context "when the user does not exists" do
    subject(:resp) do
      VCR.use_cassette("user_badges_not_exists") do
        @envato.user.badges username: "collis123"
      end
    end

    it { expect { resp }.to raise_error Envato::Error, /could not find the user/ }
  end
end

RSpec.describe "#user.account" do
  subject(:resp) do
    VCR.use_cassette("user_account") do
      @envato.user.account
    end
  end

  it { expect(resp).to be_instance_of(Envato::UserAccount) }
end

RSpec.describe "#user.collections" do
  subject(:resp) do
    VCR.use_cassette("user_collections") do
      @envato.user.collections
    end
  end

  it { expect(resp).to be_instance_of(Envato::Collection) }
  it { expect(resp.data.first).to be_instance_of(Envato::UserCollection) }
end

RSpec.describe "#user.collection" do
  context "with id param" do
    subject(:resp) do
      VCR.use_cassette("user_collection") do
        @envato.user.collection(id: "4551957")
      end
    end

    it { expect(resp).to be_instance_of(Envato::Collection) }
    it { expect(resp.items).to be_instance_of(Array) }
  end

  context "without id param" do
    subject(:resp) do
      VCR.use_cassette("user_collection") do
        @envato.user.collection
      end
    end

    it { expect { resp }.to raise_error(ArgumentError) }
  end
end

RSpec.describe "#user.statement" do
  subject(:resp) do
    VCR.use_cassette("user_statement") do
      @envato.user.statement
    end
  end

  it { expect(resp).to be_instance_of(Envato::UserStatement) }
  it { expect(resp.count).to be_an(Integer) }
  it { expect(resp.results).to be_instance_of(Array) }
  it { expect(resp.results.first).to be_instance_of(OpenStruct) }
end

RSpec.describe "#user.items" do
  subject(:resp) do
    VCR.use_cassette("user_items") do
      @envato.user.items username: "collis"
    end
  end

  it { expect(resp).to be_instance_of(Envato::Collection) }
  it { expect(resp.data.first).to be_an(Envato::Item) }
end
