class Discount < ActiveRecord::Base
    has_and_belongs_to_many :services
    has_and_belongs_to_many :prices
end