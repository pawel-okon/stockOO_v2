class ConnectUserWithProducts < ActiveRecord::Migration
  def up
    change_table :products do |t|
      t.integer :user_id, :index => true, :references => :users
    end
  end

  def down
    remove_column :products, :user_id
  end
end
