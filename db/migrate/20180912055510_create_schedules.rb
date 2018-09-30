class CreateSchedules < ActiveRecord::Migration[5.1]
  def change
    create_table :schedules do |t|
      t.references :user
      
      t.integer :getu_start
      t.integer :getu_end
      t.integer :ka_start
      t.integer :ka_end
      t.integer :sui_start
      t.integer :sui_end
      t.integer :moku_start
      t.integer :moku_end
      t.integer :kin_start
      t.integer :kin_end
      t.integer :doyou_start
      t.integer :doyou_end
      t.integer :niti_start
      t.integer :niti_end

      t.timestamps
    end
  end
end