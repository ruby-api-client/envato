# frozen_string_literal: true

module Envato
  class SearchResource < Resource
    def more_like_this(item_id:, page: 1, page_size: 10)
      resp = get("v1/discovery/search/search/more_like_this?item_id=#{item_id}&page=#{page}&page_size=#{page_size}")
      Collection.from_response(resp, key: "matches", type: Item)
    end
    alias like more_like_this

    def comments(item_id:, page: 1, page_size: 10)
      resp = get("v1/discovery/search/search/comment?item_id=#{item_id}&page=#{page}&page_size=#{page_size}")
      Collection.from_response(resp, key: "matches", type: Comment)
    end

    def item
      resp = get("v1/discovery/search/search/item")
      Collection.from_response(resp, key: "matches", type: Item)
    end
  end
end
