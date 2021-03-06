class CreateAdmins < ActiveRecord::Migration
  def up
    create_table :admins do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_hash

      t.timestamps
    end
  end

  def down
    drop_table :admins
  end
end
