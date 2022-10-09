# frozen_string_literal: true

module Envato
  class ItemResource < Resource
    def prices(item_id:)
      resp = get("v1/market/item-prices:#{item_id}.json")
      Collection.from_response(resp, key: "item-prices", type: ItemPrice)
    end

    def download(item_id:, purchase_code:, shorten_url: true)
      Object.new get("v3/market/buyer/download?item_id=#{item_id}&purchase_code=#{purchase_code}&shorten_url=#{shorten_url}").body
    end

    # TODO: filter_by: wordpress-plugins | wordpress-themes
    def list_purchases(filter_by: "wordpress-themes", page: 1, details: false)
      resp = get("v3/market/buyer/list-purchases?filter_by=#{filter_by}&page=#{page}&details=#{details}")
      Collection.from_response(resp, key: "results", type: Item)
    end

    def purchase(code:)
      Object.new get("v3/market/buyer/purchase?code=#{code}").body
    end

    def purchases
      resp = get("v3/market/buyer/purchases")
      Collection.from_response(resp, key: "purchases", type: Item)
    end

    def version(id:)
      Object.new get("v3/market/catalog/item-version?id=#{id}").body
    end

    def info(id:)
      Item.new get("v3/market/catalog/item").body
    end
  end
end
