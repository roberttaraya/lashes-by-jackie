class CreateAppointments < ActiveRecord::Migration
  def up
    create_table :appointments do  |t|
      t.datetime :date
    end
  end

  def down
    drop_table :appointments
  end
end
