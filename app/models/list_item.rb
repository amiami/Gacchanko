class ListItem < ApplicationRecord
  belongs_to :packing_list
  validates :item_name, presence: true
end
