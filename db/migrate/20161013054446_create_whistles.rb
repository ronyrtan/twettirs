class CreateWhistles < ActiveRecord::Migration
  def change
    create_table :whistles do |t|
      t.integer :user_id
      t.text :post
      t.integer :star

      t.timestamps null: false
    end
  end
end
