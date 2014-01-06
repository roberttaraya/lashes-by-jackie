class CreatePrices < ActiveRecord::Migration
  def up
    create_table :prices do |t|
      t.decimal :dollar_amount

      t.timestamps
    end
  end

  def down
    drop_table :prices
  end
end
