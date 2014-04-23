class AddBarcodeToProductsRemoveWeight < ActiveRecord::Migration
  def up
    add_column :products, :barcode, :integer
    remove_column :products, :weight
  end

  def down
    remove_column :products,  :barcode
    add_column :products, :weight, :float
  end
end
