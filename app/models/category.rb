class Category < ActiveRecord::Base
  include Orderable
  include TimeFilterable

  has_many :products
end
