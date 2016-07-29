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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160729130847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

  create_table "client_contacts", force: :cascade do |t|
    t.string   "position"
    t.string   "name",          null: false
    t.string   "businessPhone"
    t.string   "mobilePhone"
    t.string   "email"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "client_id"
  end

  add_index "client_contacts", ["client_id"], name: "index_client_contacts_on_client_id", using: :btree

  create_table "clients", force: :cascade do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "fax"
    t.string   "phone"
    t.string   "email"
    t.string   "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "city"
    t.string   "state"
    t.string   "zip"
    t.string   "entity"
    t.string   "status"
    t.datetime "joinDate"
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "notable_type"
    t.integer  "notable_id"
  end

  add_index "notes", ["notable_type", "notable_id"], name: "index_notes_on_notable_type_and_notable_id", using: :btree

  create_table "project_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "dueDate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "project_types_task_items", id: false, force: :cascade do |t|
    t.integer "project_type_id", null: false
    t.integer "task_item_id",    null: false
  end

  add_index "project_types_task_items", ["project_type_id", "task_item_id"], name: "project_type_task_item", using: :btree
  add_index "project_types_task_items", ["task_item_id", "project_type_id"], name: "task_item_project_type", using: :btree

  create_table "projects", force: :cascade do |t|
    t.datetime "startDate"
    t.datetime "completedDate"
    t.datetime "dueDate"
    t.integer  "client_id"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "project_type_id"
    t.integer  "leadTimeDays"
    t.boolean  "isRecurring",     default: false, null: false
    t.string   "status"
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id", using: :btree
  add_index "projects", ["project_type_id"], name: "index_projects_on_project_type_id", using: :btree

  create_table "task_items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "sortOrder",       default: 0
    t.datetime "startDate"
    t.datetime "endDate"
    t.integer  "project_type_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "task_items", ["project_type_id"], name: "index_task_items_on_project_type_id", using: :btree

  create_table "time_entries", force: :cascade do |t|
    t.datetime "startTime",    null: false
    t.datetime "endTime"
    t.integer  "duration"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "user_id"
    t.integer  "task_item_id"
    t.integer  "project_id"
  end

  add_index "time_entries", ["project_id"], name: "index_time_entries_on_project_id", using: :btree
  add_index "time_entries", ["task_item_id"], name: "index_time_entries_on_task_item_id", using: :btree
  add_index "time_entries", ["user_id"], name: "index_time_entries_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.string   "access_token"
    t.string   "username",                            null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "client_contacts", "clients"
  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "project_types"
  add_foreign_key "task_items", "project_types"
  add_foreign_key "time_entries", "projects"
  add_foreign_key "time_entries", "task_items"
  add_foreign_key "time_entries", "users"
end
