# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140106184706) do

  create_table "admins", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "appointments", :force => true do |t|
    t.datetime "appointment_date"
    t.integer  "users_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "appointments_services", :id => false, :force => true do |t|
    t.integer "appointments_id"
    t.integer "services_id"
  end

  create_table "discounts", :force => true do |t|
    t.decimal  "percent_off"
    t.decimal  "dollar_amount"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "prices", :force => true do |t|
    t.decimal  "dollar_amount"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "prices_services", :id => false, :force => true do |t|
    t.integer "services_id"
    t.integer "prices_id"
    t.integer "discounts_id"
  end

  create_table "services", :force => true do |t|
    t.string   "lash_full_set"
    t.string   "lash_refill_two_week"
    t.string   "waxing_lip"
    t.string   "waxing_brow"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "cell_phone"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
