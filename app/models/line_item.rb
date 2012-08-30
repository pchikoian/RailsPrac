class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :product, :cart
  belongs_to :cart
  belongs_to :product
end
