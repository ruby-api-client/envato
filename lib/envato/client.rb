# frozen_string_literal: true

module Envato
  class Client
    BASE_URL = "https://api.envato.com/v1"

    attr_reader :token, :adapter

    def initialize(token:, adapter: Faraday.default_adapter, stubs: nil)
      @token = token
      @adapter = adapter
      @stubs = stubs # Test stubs for requests
    end

    def users
      UsersResource.new(self)
    end

    def connection
      @connection ||= Faraday.new(BASE_URL) do |conn|
        conn.request :authorization, :OAuth, token
        conn.request :json
        conn.request :url_encoded

        conn.response :json, content_type: "application/json"

        conn.adapter adapter, @stubs
      end
    end
  end
end
