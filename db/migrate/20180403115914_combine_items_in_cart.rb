class CombineItemsInCart < ActiveRecord::Migration[5.1]
  def up
	# replace multiple items for a single product in a cart with a single item
	Cart.all.each do |cart|
	# count the number of each product in the cart
	sums = cart.line_items.group(:product_id).sum(:quantity)
	sums.each do |prod_id, quantity|
		debugger
	if quantity > 1
	# remove individual items
	cart.line_items.where(product_id: prod_id).delete_all
	# replace with a single item
	item = cart.line_items.build(product_id: prod_id)
	item.quantity = quantity
	item.save!
	end
	end
	end
	end

	def down
	# split items with quantity>1 into multiple items
	LineItem.where("quantity>1").each do |line_item|
	# add individual items
	Chapter 10. Task E: A Smarter Cart • 120
	Prepared exclusively for Ruben Lopez report erratum • discuss
	line_item.quantity.times do
	LineItem.create cart_id: line_item.cart_id,
	product_id: line_item.product_id
	end
	# remove original item
	line_item.destroy
	end
	end
end
