class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title 
  has_many :line_items
  
  before_destroy :ensure_not_referenced_by_any_line_item

  default_scope :order => 'title'
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates :image_url, :format => {
    :with     => %r{\.(gif|jpg|png)$}i,
    :message  => 'must be URL for GIF, JPG or PHG image.'}
  
  def ensure_not_referenced_by_any_line_item
    if line_item.count.zero?
      return true
    else
      errors.add(:base, 'Line Items present')
      return false
    end
  end
end
