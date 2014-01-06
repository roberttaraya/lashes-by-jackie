class Service > ActiveRecord::Base
  has_and_belongs_to_many :appointments
  has_and_belongs_to_many :discounts
  has_and_belongs_to_many :prices
end
