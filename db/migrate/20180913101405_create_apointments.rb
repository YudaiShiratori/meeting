class CreateApointments < ActiveRecord::Migration[5.1]
  def change
    create_table :apointments do |t|
      t.boolean :presence, default: true
      t.references :schedule
      t.bigint  :interviewee_id
      
      t.timestamps
    end
  end
end
