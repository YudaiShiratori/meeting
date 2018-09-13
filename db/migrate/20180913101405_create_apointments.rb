class CreateApointments < ActiveRecord::Migration[5.1]
  def change
    create_table :apointments do |t|
      t.boolean :presence
      t.int     :schedule_id
      t.int     :interviewee_id
      
      t.timestamps
    end
  end
end
