class CreateAppointments < ActiveRecord::Migration[5.1]
  def change
    create_table :appointments do |t|
<<<<<<< HEAD
      t.references :schedule
      t.references :user
=======
      t.references :eachschedule
>>>>>>> fb14993e971b34332b35fb07886e84f75eb56d82
      t.integer :interviewee_id
      t.references :user
      t.text    :message

      t.timestamps
    end
  end
end
