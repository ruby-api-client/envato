# frozen_string_literal: true

module Envato
  class UsersResource < Resource
    def total
      UsersTotal.new get("v1/market/total-users.json").body
    end
    alias totat_users total
  end
end
