# frozen_string_literal: true

module Envato
  class Client
    BASE_URL = "https://api.envato.com"

    attr_reader :token, :adapter

    def initialize(token:, adapter: Faraday.default_adapter, stubs: nil)
      @token = token
      @adapter = adapter
      @stubs = stubs # Test stubs for requests
    end

    def user
      UserResource.new(self)
    end

    def users
      UsersResource.new(self)
    end

    def search
      SearchResource.new(self)
    end

    def market
      MarketResource.new(self)
    end

    def markets
      MarketsResource.new(self)
    end

    def bookmarks
      BookmarksResource.new(self)
    end

    def item
      ItemResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :Bearer, token
        conn.request :json
        conn.request :url_encoded

        conn.response :json, content_type: "application/json"

        # TODO: remove
        # conn.response :logger, nil, { headers: true, bodies: true }
        conn.adapter adapter, @stubs
      end
    end
  end
end
