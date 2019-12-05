class Favorite < ApplicationRecord
  belongs_to :dish
  belongs_to :user

  validates :dish, uniqueness: { scope: :user }

end
