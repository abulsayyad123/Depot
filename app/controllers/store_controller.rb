class StoreController < ApplicationController
  skip_before_action :authorize
  
  def index
  	@counter = store_counter
  	@products = Product.order(:title)
  	@cart = current_cart
  end
end
