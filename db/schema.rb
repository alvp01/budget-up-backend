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

ActiveRecord::Schema[7.1].define(version: 2024_02_01_145921) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "budgets", force: :cascade do |t|
    t.float "planned_amount", null: false
    t.float "remaining_amount", null: false
    t.date "budget_date", default: "2024-02-01", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string "category_type", null: false
    t.integer "budget_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_categories_on_budget_id"
  end

  create_table "item_categories", force: :cascade do |t|
    t.integer "item_id"
    t.integer "category_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_item_categories_on_category_id"
    t.index ["item_id"], name: "index_item_categories_on_item_id"
  end

  create_table "item_transactions", force: :cascade do |t|
    t.integer "item_id"
    t.integer "transaction_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_transactions_on_item_id"
    t.index ["transaction_id"], name: "index_item_transactions_on_transaction_id"
  end

  create_table "items", force: :cascade do |t|
    t.float "planned_amount", default: 0.0, null: false
    t.float "allocated_amount", default: 0.0, null: false
    t.integer "item_type", default: 0, null: false
    t.string "label"
    t.integer "category_id"
    t.integer "budget_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["budget_id"], name: "index_items_on_budget_id"
    t.index ["category_id"], name: "index_items_on_category_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.datetime "date"
    t.string "note"
    t.float "amount", default: 0.0, null: false
    t.integer "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_transactions_on_item_id"
  end

end
