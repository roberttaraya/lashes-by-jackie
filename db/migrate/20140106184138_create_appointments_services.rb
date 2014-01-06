class CreateAppointmentsServices < ActiveRecord::Migration
  def up
    create_table :appointments_services, id: false do |t|
      t.belongs_to :appointments
      t.belongs_to :services
    end
  end

  def down
    drop_table :appointments_services
  end
end
