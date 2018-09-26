class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
      t.references :eachschedule
      t.integer :interviewee_id
      t.references :user
      t.text    :message

      t.timestamps
    end
  end
end
