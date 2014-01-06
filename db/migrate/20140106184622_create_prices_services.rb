class CreatePricesServices < ActiveRecord::Migration
  def up
    create_table :prices_services, id: false do |t|
      t.belongs_to :services
      t.belongs_to :prices
      t.belongs_to :discounts
    end
  end

  def down
    drop_table :prices_services
  end
end
