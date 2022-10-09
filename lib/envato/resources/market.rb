# frozen_string_literal: true

module Envato
  class MarketResource < Resource
    def user(username:)
      Object.new get("v1/market/user:#{username}").body
    end

    # TODO: move methods to CategoriesResource
    def categories(site:)
      resp = get("v1/market/categories:#{site}.json")
      Collection.from_response(resp, key: "categories", type: Category)
    end

    def categories_themeforest
      categories(site: "themeforest")
    end

    def categories_photodune
      categories(site: "photodune")
    end

    def categories_codecanyon
      categories(site: "codecanyon")
    end

    def categories_videohive
      categories(site: "videohive")
    end

    def categories_audiojungle
      categories(site: "audiojungle")
    end

    def categories_graphicriver
      categories(site: "graphicriver")
    end

    def categories_3docean
      categories(site: "3docean")
    end

    def features(site:)
      Object.new get("v1/market/features:#{site}.json").body
    end

    def features_themeforest
      features(site: "themeforest")
    end

    def features_photodune
      features(site: "photodune")
    end

    def features_codecanyon
      features(site: "codecanyon")
    end

    def features_videohive
      features(site: "videohive")
    end

    def features_audiojungle
      features(site: "audiojungle")
    end

    def features_graphicriver
      features(site: "graphicriver")
    end

    def features_3docean
      features(site: "3docean")
    end

    def new_files(site:, category:)
      Object.new get("v1/market/new-files:#{site},#{category}.json")
    end

    def new_files_from_user(username:, site:)
      Object.new get("v1/market/new-files-from-user:#{username},#{site}.json")
    end

    def random_new_files(site:)
      Object.new get("v1/market/random-new-files:#{site}.json")
    end

    def collection(id:, page: 1)
      Object.new get("v3/market/catalog/collection?id=#{id}&page=#{page}").body
    end
  end
end
