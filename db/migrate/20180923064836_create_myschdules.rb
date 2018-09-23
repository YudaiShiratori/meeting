class CreateMyschdules < ActiveRecord::Migration[5.1]
  def change
    create_table :myschdules do |t|
      t.integer :user_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
