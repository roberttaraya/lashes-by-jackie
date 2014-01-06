class CreateAppointments < ActiveRecord::Migration
  def up
    create_table :appointments do  |t|
      t.datetime :apppointment_date
      t.belongs_to :users

      t.timestamps
    end
  end

  def down
    drop_table :appointments
  end
end
