class CreateServices < ActiveRecord::Migration
  def up
    create_table :services do |t|
      t.string :lash_full_set
      t.string :lash_refill_two_week
      t.string :waxing_lip
      t.string :waxing_brow

      t.timestamps
    end
  end

  def down
    drop_table :services
  end
end
