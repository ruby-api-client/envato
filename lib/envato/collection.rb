# frozen_string_literal: true

module Envato
  class Collection
    # TODO: links: { next_page_url, prev_page_url, first_page_url, last_page_url }
    # TODO: total_hits:
    # TODO: took:
    attr_reader :data, :items, :total

    def self.from_response(response, key:, type:)
      body = response.body
      new(
        data: body[key].map {|attrs| type.new(attrs) },
        items: body["items"],
        total: body["total"]
      )
    end

    def initialize(data:, items:, total:)
      @data   = data
      @items  = items
      @total  = total
    end
  end
end
