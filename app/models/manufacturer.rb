class Manufacturer < ActiveRecord::Base
  include Orderable
  include TimeFilterable

  has_many :products

  validates_presence_of :name
  validates_uniqueness_of :name
end
