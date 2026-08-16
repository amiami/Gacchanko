class Kit < ApplicationRecord
  belongs_to :user
  has_many :kit_items, dependent: :destroy
  validates :name, presence: true, uniqueness: { scope: :user_id }
  validates :category, presence: true
end
