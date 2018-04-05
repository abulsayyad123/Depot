class LineItemsController < ApplicationController
	skip_before_action :authorize, only: :create

	def create
		 @cart = current_cart
		 byebug
		 product = Product.find(params[:product_id])
		 @line_item = @cart.add_product(product.id)
		 @line_item = @cart.line_items.create
		 @line_item.product = product
		 session[:counter] = 0	

		 respond_to do |format|
			if @line_item.save
		 		format.html { redirect_to store_url }
		 		format.js { @current_item = @line_item }
				format.json { render json: @line_item,status: :created, location: @line_item }

			else
				format.html { render action: "new" }
				format.json { render json: @line_item.errors,status: :unprocessable_entity }
		 	end
		 end
	end
end