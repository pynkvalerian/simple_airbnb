class CreatePropertyTags < ActiveRecord::Migration
  def change
    create_table :property_tags do |t|
      t.integer :tag_id, null: false
      t.integer :property_id, null: false
      t.timestamps null:false
    end
  end
end
