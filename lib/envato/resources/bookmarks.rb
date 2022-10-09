# frozen_string_literal: true

module Envato
  class BookmarksResource < Resource
    def list
      resp = get("v3/market/user/bookmarks")
      Collection.from_response(resp, key: "bookmarks", type: UserBookmark)
    end

    # TODO: API error: "reason": "not-found"
    def add(collection_id:, item_id:)
      put("v3/market/user/bookmark_add?collection_id=#{collection_id}&item_id=#{item_id}")
    end

    def remove(id:)
      delete("v3/market/user/bookmark_remove?id=#{id}")
    end

    # TODO: bookmarks_for_items
    # TODO: item_ids: comma separated "12312312,123123123,12312312"
    def for_items(item_ids:)
      Object.new get("v3/market/user/bookmarks_for_items?item_ids=#{item_ids}").body
    end

    # TODO: add to CollectionResource
    # TODO: API error: "reason": "not-found"
    def collection_create(name:, site:, description:, is_public: false)
      Object.new post("v3/market/user/collection_create?name=#{name}&site=#{site}&public=#{is_public}&description=#{description}").body
    end
  end
end
