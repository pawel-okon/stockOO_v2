class ConnectCategoriesWithProducts < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.integer :category_id, :index => true, :referenves => :categories
    end
  end

  def down
    remove_column :products, :category_id
  end
end
