# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_23_015607) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "category_name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customer_history", force: :cascade do |t|
    t.integer "order_id"
    t.integer "product_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "customers", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.text "address1"
    t.text "address2"
    t.string "city"
    t.string "state"
    t.integer "zip"
    t.string "country"
    t.string "email"
    t.integer "phone"
    t.string "credit_card_type"
    t.integer "credit_card"
    t.datetime "credit_card_expiration"
    t.string "password"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "inventories", force: :cascade do |t|
    t.integer "quantity_in_stock"
    t.integer "sales"
    t.bigint "product_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_inventories_on_product_id"
  end

  create_table "orderlines", force: :cascade do |t|
    t.integer "quantity"
    t.datetime "orderdate"
    t.bigint "products_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "order_id"
    t.index ["order_id"], name: "index_orderlines_on_order_id"
    t.index ["products_id"], name: "index_orderlines_on_products_id"
  end

  create_table "orders", force: :cascade do |t|
    t.datetime "order_date"
    t.decimal "net_amount"
    t.decimal "tax"
    t.decimal "total_amount"
    t.bigint "customer_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["customer_id"], name: "index_orders_on_customer_id"
  end

  create_table "products", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.string "actor"
    t.decimal "price"
    t.decimal "special"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "common_product_id"
    t.integer "category_id"
  end

  create_table "reorder", force: :cascade do |t|
    t.bigint "product_id", null: false
    t.datetime "date_low"
    t.integer "quantity_low"
    t.datetime "date_reordered"
    t.integer "quantity_ordered"
    t.datetime "date_expected"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["product_id"], name: "index_reorder_on_product_id"
  end

  add_foreign_key "inventories", "products"
  add_foreign_key "orderlines", "orders"
  add_foreign_key "orderlines", "products", column: "products_id"
  add_foreign_key "orders", "customers"
  add_foreign_key "reorder", "products"
end
