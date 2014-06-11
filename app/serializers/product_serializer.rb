class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :amount, :description
end
