class CreateStarWhistles < ActiveRecord::Migration
  def change
    create_table :star_whistles do |t|
      t.integer :whistle_id
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
