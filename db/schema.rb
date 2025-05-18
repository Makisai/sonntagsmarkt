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

ActiveRecord::Schema[8.0].define(version: 2025_05_11_212629) do
  create_table "stands", force: :cascade do |t|
    t.decimal "width"
    t.decimal "height"
    t.decimal "depth"
    t.decimal "diameter"
    t.text "description"
    t.integer "cooler"
    t.integer "table"
    t.boolean "selfdriver"
    t.boolean "trailer"
    t.boolean "power"
    t.text "specials"
    t.text "misc"
    t.integer "vendor_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["vendor_id"], name: "index_stands_on_vendor_id"
  end

  create_table "vendors", force: :cascade do |t|
    t.string "name"
    t.string "legalform"
    t.string "contact"
    t.string "address"
    t.string "phone"
    t.string "email"
    t.string "taxnumber"
    t.string "taxoffice"
    t.date "last_visit"
    t.string "visit_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "stands", "vendors"
end
