# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_08_19_173858) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_health_insurances", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_health_units", force: :cascade do |t|
    t.string "name"
    t.string "city"
    t.string "address"
    t.string "phone"
    t.string "category"
    t.string "token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_queues", force: :cascade do |t|
    t.bigint "health_unit_id", null: false
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["health_unit_id"], name: "index_app_queues_on_health_unit_id"
  end

  create_table "app_users", force: :cascade do |t|
    t.boolean "finished"
    t.string "reference"
    t.bigint "queue_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["queue_id"], name: "index_app_users_on_queue_id"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string "email"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "app_queues", "app_health_units", column: "health_unit_id"
  add_foreign_key "app_users", "app_queues", column: "queue_id"
end
