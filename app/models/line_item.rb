class LineItem < ApplicationRecord
    belongs_to :order
	belongs_to :product
	belongs_to :cart

	# attr_accessor :cart_id, :product_id

	def total_price
		product.price * quantity
	end
end
