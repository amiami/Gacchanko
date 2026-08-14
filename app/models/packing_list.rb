# app/models/packing_list.rb
class PackingList < ApplicationRecord
  has_many :list_items, dependent: :destroy
  validates :name, presence: true

  def checked_count
    list_items.count(&:is_checked)
  end

  def total_count
    list_items.size
  end

  def completed?
    total_count > 0 && checked_count == total_count
  end
end
