# frozen_string_literal: true

require "spec_helper"
require "envato"

RSpec.describe "#users.total" do
  subject(:resp) do
    VCR.use_cassette("users_total") do
      @envato.users.total
    end
  end

  it { expect(resp).to be_instance_of(Envato::UsersTotal) }
  it { expect(resp["total-users"].total_users).to eq("16863730") }
end
