class Restaurant < ApplicationRecord
  has_many :dishes, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
end
