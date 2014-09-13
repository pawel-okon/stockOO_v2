class Product < ActiveRecord::Base
  include Orderable
  include TimeFilterable

  belongs_to :user
  belongs_to :category
  belongs_to :manufacturer
end
