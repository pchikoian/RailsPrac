class StoreController < ApplicationController
  def index
    @products = Product.all
    @time = Time.new
  end
end
