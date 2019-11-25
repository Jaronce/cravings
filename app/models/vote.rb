class Vote < ApplicationRecord
  belongs_to :dish
  belongs_to :user
end
