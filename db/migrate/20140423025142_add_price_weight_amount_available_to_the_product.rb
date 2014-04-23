class AddPriceWeightAmountAvailableToTheProduct < ActiveRecord::Migration
  def change
    change_table :products do |t|
      t.decimal :price, :default => 0.00
      t.boolean :available, :default => false
      t.float :weight, :default => 0.00
      t.integer :amount, :default => 0
    end
  end
end
