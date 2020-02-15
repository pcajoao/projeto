class Product < ApplicationRecord
    belongs_to :category, :optional => true
    has_many :comments, dependent: :destroy
    scope :filter_by_category_id, -> (cat_id) { where cat_id: cat_id }
end
