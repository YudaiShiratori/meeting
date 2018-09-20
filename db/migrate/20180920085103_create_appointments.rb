class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.boolean :presence, default: true
      t.integer :schedule_id
      t.integer :interviewee_id
      t.text    :message

      t.timestamps
    end
  end
end
