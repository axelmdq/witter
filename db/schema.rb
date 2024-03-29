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

ActiveRecord::Schema.define(:version => 20130326155345) do

  create_table "comments", :force => true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.integer  "tweet_id"
  end

  create_table "friendships", :force => true do |t|
    t.integer  "user_id"
    t.boolean  "best_friend"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
    t.integer  "friend_id"
  end

  create_table "tweets", :force => true do |t|
    t.string   "text"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username"
    t.string   "name"
    t.string   "surname"
    t.string   "password"
    t.string   "about_me"
    t.datetime "created_at",           :null => false
    t.datetime "updated_at",           :null => false
    t.string   "email"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
  end

end
