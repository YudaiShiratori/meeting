class CreateApointments < ActiveRecord::Migration[5.1]
  def change
    create_table :apointments do |t|
      t.boolean :presence
      t.integer :schedule_id
      t.integer :interviewee_id
      
      t.timestamps
    end
  end
end
