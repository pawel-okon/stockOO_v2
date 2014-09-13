class Category < ActiveRecord::Base
  include Orderable
  include TimeFilterable

  attr_accessible :name
  has_many :products
end
