# frozen_string_literal: true

module Envato
  class UserResource < Resource
    def statement
      Object.new get("v3/market/user/statement").body
    end

    def collections
      resp = get("v3/market/user/collections")
      Collection.from_response(resp, key: "collections", type: UserCollection)
    end

    def collection(id:)
      UserCollection.new get("v3/market/user/collection?#{id}").body
    end

    # def bookmarks
    #   resp = get("v3/market/user/bookmarks")
    #   Collection.from_response(resp, key: "bookmarks", type: UserBookmark)
    # end

    def items(username:)
      resp = get("v1/market/user-items-by-site:#{username}.json")
      Collection.from_response(resp, key: "user-items-by-site", type: SiteItem)
    end

    def popular_items(site:)
      Object.new get("v1/market/user-items-by-site:#{username}.json").body
    end

    def popular_items_themeforest
      popular_items(site: "themeforest")
    end

    def popular_items_photodune
      popular_items(site: "photodune")
    end

    def popular_items_codecanyon
      popular_items(site: "codecanyon")
    end

    def popular_items_videohive
      popular_items(site: "videohive")
    end

    def popular_items_audiojungle
      popular_items(site: "audiojungle")
    end

    def popular_items_graphicriver
      popular_items(site: "graphicriver")
    end

    def popular_items_3docean
      popular_items(site: "3docean")
    end

    def badges(username:)
      resp = get("v1/market/user-badges:#{username}.json")
      Collection.from_response(resp, key: "user-badges", type: UserBadge)
    end

    def earnings_and_sales
      Object.new get("v1/market/private/user/earnings-and-sales-by-month.json").body
    end
    # alias sales_and_earnings earnings_and_sales

    def account
      Object.new get("/v1/market/private/user/account.json").body
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
      AuthorSale.new get("v3/market/author/sale?code=#{code}").body
    end

    # TODO: rename and move to CollectionResource
    def add_to_favorite(item_id:)
      put("v3/market/user/favourite_collection_add?item_id=#{item_id}")
    end
  end
end
