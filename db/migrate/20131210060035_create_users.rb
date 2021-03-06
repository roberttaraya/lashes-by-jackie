class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :cell_phone
      t.string :password_digest
      t.string :remember_token

      t.timestamps
    end
  end

  def down
    drop_table :users
  end
end
