class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :email
      t.text :username
      t.text :name
      t.string :password_digest
      t.text :profile_pic

      t.timestamps null: false
    end
  end
end
