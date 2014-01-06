class CreateDiscounts < ActiveRecord::Migration
  def up
    create_table :discounts do |t|
      t.decimal :percent_off
      t.decimal :dollar_amount

      t.timestamps
    end
  end

  def down
    drop_table :discounts
  end
end
