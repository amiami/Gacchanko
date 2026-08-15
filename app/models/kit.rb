class Kit < ApplicationRecord
  has_many :kit_items, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
end
