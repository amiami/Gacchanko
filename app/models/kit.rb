class Kit < ApplicationRecord
  has_many :kit_items, dependent: :destroy
end
