class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :schedule
      t.references :user
      t.integer :interviewee_id
      t.text    :message

      t.timestamps
    end
  end
end
