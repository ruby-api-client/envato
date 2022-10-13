# frozen_string_literal: true

module Envato
  class UserResource < Resource
    def statement
      UserStatement.new get("v3/market/user/statement").body
    end

    def collections
      resp = get("v3/market/user/collections")
      Collection.from_response(resp, key: "collections", type: UserCollection)
    end

    def collection(id:)
      resp = get("v3/market/user/collection?id=#{id}")
      Collection.from_response(resp, key: "items", type: CollectionItem)
    end

    def items(username:)
      resp = get("v1/market/user-items-by-site:#{username}.json")
      Collection.from_response(resp, key: "user-items-by-site", type: Item)
    end

    def badges(username:)
      resp = get("v1/market/user-badges:#{username}.json")
      Collection.from_response(resp, key: "user-badges", type: UserBadge)
    end

    def earnings_and_sales
      Object.new get("v1/market/private/user/earnings-and-sales-by-month.json").body
    end
    alias sales_and_earnings earnings_and_sales

    def account
      UserAccount.new get("/v1/market/private/user/account.json").body
    end

    def name
      Object.new get("v1/market/private/user/username.json").body
    end
    alias username name

    def email
      Object.new get("v1/market/private/user/email.json").body
    end

    def sales
      Object.new get("v1/market/private/author/sales").body
    end

    def sale(code:)
      UserSale.new get("v3/market/author/sale?code=#{code}").body
    end

    # TODO: rename and move to CollectionResource
    def add_to_favorite(item_id:)
      put("v3/market/user/favourite_collection_add?item_id=#{item_id}")
    end
  end
end
