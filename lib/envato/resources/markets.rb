# frozen_string_literal: true

module Envato
  class MarketsResource < Resource
    def number_of_files(site:)
      Object.new get("v1/market/number-of-files:#{site}.json").body
    end

    def total_themeforest
      number_of_files(site: "themeforest")
    end

    def total_photodune
      number_of_files(site: "photodune")
    end

    def total_codecanyon
      number_of_files(site: "codecanyon")
    end

    def total_videohive
      number_of_files(site: "videohive")
    end

    def total_audiojungle
      number_of_files(site: "audiojungle")
    end

    def total_graphicriver
      number_of_files(site: "graphicriver")
    end

    def total_3docean
      number_of_files(site: "3docean")
    end

    def total_users
      Object.new get("v1/market/total-users.json")
    end

    def total_items
      Object.new get("v1/market/total-items.json")
    end
  end
end
