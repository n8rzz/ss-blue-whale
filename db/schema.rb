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

ActiveRecord::Schema.define(version: 20160407010926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "uuid-ossp"

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
  end

  create_table "project_types", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "dueDate"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "projects", force: :cascade do |t|
    t.datetime "startDate"
    t.datetime "completedDate"
    t.datetime "dueDate"
    t.integer  "client_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "project_type_id"
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

  add_foreign_key "projects", "clients"
  add_foreign_key "projects", "project_types"
  add_foreign_key "task_items", "project_types"
end
