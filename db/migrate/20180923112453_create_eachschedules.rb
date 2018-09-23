class CreateEachschedules < ActiveRecord::Migration[5.1]
  def change
    create_table :eachschedules do |t|
      t.integer :start
      t.references :user
      t.references :schedule

      t.timestamps
    end
  end
end
