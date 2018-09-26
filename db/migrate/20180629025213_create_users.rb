class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.timestamps
      
      t.text :image
      t.text :introduction
      
      t.string :skypeID
      
    end
  end
end
