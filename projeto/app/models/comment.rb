class Comment < ApplicationRecord
    belongs_to :user, :optional => true
    belongs_to :product, :optional => true 
    scope :filter_by_product_id, -> (product_id) { where product_id: product_id }
end
