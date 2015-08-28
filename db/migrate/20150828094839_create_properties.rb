class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :title, null: false
      t.string :description, null: false
      t.string :address, null: false
      t.integer :price, null: false
      t.integer :user_id, null: false
      t.timestamps null: false
    end
  end
end
