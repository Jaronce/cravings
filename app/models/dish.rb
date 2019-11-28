class Dish < ApplicationRecord
  include AlgoliaSearch

  belongs_to :restaurant
  belongs_to :category

  has_many :votes, dependent: :destroy
  has_many :reviews, dependent: :destroy

  algoliasearch do
    attributes :name
  end
end
