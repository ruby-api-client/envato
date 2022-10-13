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

    # TODO: Features.new
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

    def popular_items(site:)
      Object.new get("v1/market/popular:#{site}.json").body
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

    # TODO: add themeforest, graphicriver, etc.
    def new_files(site:, category:)
      resp = get("v1/market/new-files:#{site},#{category}.json")
      Collection.from_response(resp, key: "new-files", type: Item)
    end

    # TODO: add themeforest, etc.
    def new_files_graphicriver(category:)
      new_files(site: "graphicriver", category: category)
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
