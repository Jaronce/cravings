class Category < ApplicationRecord
  include AlgoliaSearch
  has_many :dishes

  algoliasearch do
    attributes :name
  end
end
