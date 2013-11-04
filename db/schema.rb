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

ActiveRecord::Schema.define(:version => 20131104205447) do

  create_table "addresses", :force => true do |t|
    t.integer  "user_id"
    t.text     "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "addresses", ["user_id"], :name => "index_addresses_on_user_id"

  create_table "aptitudes", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "aptitudes_programs", :id => false, :force => true do |t|
    t.integer "aptitude_id", :null => false
    t.integer "program_id",  :null => false
  end

  add_index "aptitudes_programs", ["aptitude_id", "program_id"], :name => "index_aptitudes_programs_on_aptitude_id_and_program_id", :unique => true

  create_table "configurations", :force => true do |t|
    t.integer  "user_id"
    t.integer  "frequency_id"
    t.boolean  "notification_in_real_time"
    t.boolean  "can_send_email"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "contact_numbers", :force => true do |t|
    t.integer  "user_id"
    t.integer  "type_of_number_id"
    t.string   "number"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "dependencies", :force => true do |t|
    t.string   "name"
    t.integer  "type_of_administration_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  create_table "dependency_addresses", :force => true do |t|
    t.integer  "dependency_id"
    t.string   "street"
    t.string   "number"
    t.string   "colony"
    t.string   "postalcode"
    t.string   "city"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "dependency_attendants", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "dependency_id"
  end

  create_table "frequencies", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "herarchy_of_institutions", :force => true do |t|
    t.integer  "institution_id"
    t.integer  "subinstitution_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "institution_attendants", :force => true do |t|
    t.integer  "user_id"
    t.integer  "institution_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "institutions", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "institutions", ["name"], :name => "index_institutions_on_name", :unique => true

  create_table "locations", :force => true do |t|
    t.float    "latitude",      :limit => 15, :default => 0.0
    t.float    "longitude",     :limit => 15, :default => 0.0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "dependency_id"
  end

  create_table "programs", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "quantity_of_students"
    t.integer  "turn_id"
    t.integer  "dependency_id"
    t.integer  "dependency_attendant_id"
    t.datetime "created_at",              :null => false
    t.datetime "updated_at",              :null => false
  end

  create_table "programs_aptitudes", :id => false, :force => true do |t|
    t.integer "program_id",  :null => false
    t.integer "aptitude_id", :null => false
  end

  add_index "programs_aptitudes", ["program_id", "aptitude_id"], :name => "index_programs_aptitudes_on_program_id_and_aptitude_id", :unique => true

  create_table "programs_skills", :id => false, :force => true do |t|
    t.integer "program_id", :null => false
    t.integer "skill_id",   :null => false
  end

  add_index "programs_skills", ["program_id", "skill_id"], :name => "index_programs_skills_on_program_id_and_skill_id", :unique => true

  create_table "roles", :force => true do |t|
    t.string   "type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "skills", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "students", :force => true do |t|
    t.string   "enrollment"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "institution_id"
    t.integer  "user_id"
  end

  create_table "turns", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_of_administrations", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "type_of_numbers", :force => true do |t|
    t.string   "type_of_number"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.string   "role"
    t.string   "last_name"
    t.string   "authorization"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
