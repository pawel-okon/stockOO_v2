class Product < ActiveRecord::Base
  include Orderable
  include TimeFilterable

  belongs_to :user
  belongs_to :category
  belongs_to :manufacturer

  validates_presence_of :name
  validates :category, presence: true
  validates :manufacturer, presence: true
  validates :user, presence: true
end
