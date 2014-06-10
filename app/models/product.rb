class Product < ActiveRecord::Base
  attr_accessible :description, :name, :user_id, :price, :barcode, :amount, :category_id, :manufacturer_id

  belongs_to :user
  belongs_to :category
  belongs_to :manufacturer
end
