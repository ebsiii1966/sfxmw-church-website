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

ActiveRecord::Schema.define(:version => 20120303040004) do

  create_table "news_items", :force => true do |t|
    t.string   "summary"
    t.text     "story"
    t.string   "image_url"
    t.integer  "created_by"
    t.integer  "updated_by"
    t.integer  "approved_by"
    t.datetime "post_at"
    t.datetime "expire_at"
    t.integer  "org_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.string   "picture_file_name"
    t.datetime "picture_updated_at"
    t.boolean  "top_flag"
  end

  create_table "orgs", :force => true do |t|
    t.string   "name"
    t.string   "summary"
    t.text     "description"
    t.string   "chair"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "group_flag"
    t.integer  "group_id"
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "full_name"
    t.datetime "last_login"
    t.string   "rights"
    t.boolean  "active",          :default => true
  end

end
