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

ActiveRecord::Schema.define(:version => 20130601193958) do

  create_table "campaigns", :force => true do |t|
    t.integer  "id_campaign"
    t.string   "name"
    t.integer  "id_organization"
    t.text     "description"
    t.integer  "economic_goal"
    t.integer  "man_power_goal"
    t.string   "location"
    t.datetime "date_event"
    t.datetime "date_goal"
    t.integer  "id_category"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "categories", :force => true do |t|
    t.integer  "id_category"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "organizations", :force => true do |t|
    t.integer  "id_organization"
    t.string   "name"
    t.string   "address_hq"
    t.string   "phone_number"
    t.string   "website_url"
    t.datetime "register_date"
    t.integer  "id_user"
    t.integer  "id_category"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.integer  "id_user"
    t.string   "name"
    t.integer  "age"
    t.string   "gender"
    t.string   "facebook_token"
    t.text     "bio"
    t.boolean  "is_active"
    t.string   "email"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "oauth_token"
    t.datetime "oauth_expires_at"
  end

end
