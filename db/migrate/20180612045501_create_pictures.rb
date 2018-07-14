class CreatePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :pictures do |t|
      t.text :image
      t.text :content
      
      t.references :user
      t.references :favorite_user
      
      t.timestamps
    end
  end
end
