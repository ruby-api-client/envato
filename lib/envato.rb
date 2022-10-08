# frozen_string_literal: true

require "addressable/uri"
require "faraday"
require "envato/version"

module Envato
  autoload :Client, "envato/client"
  autoload :Object, "envato/object"
  autoload :Resource, "envato/resource"
  autoload :Collection, "envato/collection"
  autoload :Error, "envato/error"
end
