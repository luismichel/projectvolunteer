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

ActiveRecord::Schema.define(:version => 20130602160333) do

  create_table "campaign_members", :force => true do |t|
    t.integer  "id_user"
    t.integer  "id_campaign"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

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
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.integer  "id_user"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  create_table "categories", :force => true do |t|
    t.integer  "id_category"
    t.string   "name"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "organization_memberships", :force => true do |t|
    t.integer  "organization_id"
    t.integer  "user_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "organization_memberships", ["organization_id", "user_id"], :name => "index_organization_memberships_on_organization_id_and_user_id", :unique => true
  add_index "organization_memberships", ["organization_id"], :name => "index_organization_memberships_on_organization_id"
  add_index "organization_memberships", ["user_id"], :name => "index_organization_memberships_on_user_id"

  create_table "organizations", :force => true do |t|
    t.integer  "id_organization"
    t.string   "name"
    t.string   "address_hq"
    t.string   "phone_number"
    t.string   "website_url"
    t.datetime "register_date"
    t.integer  "id_user"
    t.integer  "id_category"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
    t.text     "description"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

# Could not dump table "users" because of following StandardError
#   Unknown type 'password_field' for column 'password'

end
