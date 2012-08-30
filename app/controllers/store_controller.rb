class StoreController < ApplicationController
  def index
    @products = Product.all
    @time = Time.new
    @cart = current_cart
  end
end
