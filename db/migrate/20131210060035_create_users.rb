class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cell_phone
      t.string :password_hash

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
