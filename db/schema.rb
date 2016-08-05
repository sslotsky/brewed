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

ActiveRecord::Schema.define(version: 20160804161919) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "api_keys", force: :cascade do |t|
    t.string   "app_name",                  null: false
    t.string   "api_key",                   null: false
    t.boolean  "active",     default: true
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "api_tokens", force: :cascade do |t|
    t.integer  "user_id",       null: false
    t.string   "auth_token",    null: false
    t.string   "refresh_token", null: false
    t.string   "user_agent",    null: false
    t.datetime "expires_at",    null: false
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "equipment_profiles", force: :cascade do |t|
    t.string   "name"
    t.float    "batch_size",              null: false
    t.float    "kettle_volume",           null: false
    t.float    "mash_tun_volume",         null: false
    t.float    "evap_rate",               null: false
    t.float    "trub_chiller_loss",       null: false
    t.float    "mash_thickness",          null: false
    t.float    "lauter_deadspace",        null: false
    t.float    "grain_absorption_factor", null: false
    t.float    "boiling_temp",            null: false
    t.float    "mash_efficiency",         null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "extras", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fermentables", force: :cascade do |t|
    t.string   "name",       null: false
    t.integer  "ppg",        null: false
    t.integer  "color",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hops", force: :cascade do |t|
    t.string   "name",       null: false
    t.float    "alpha",      null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "recipe_extras", force: :cascade do |t|
    t.integer  "recipe_id",   null: false
    t.integer  "extra_id",    null: false
    t.float    "amount",      null: false
    t.string   "amount_unit", null: false
    t.float    "time",        null: false
    t.string   "time_unit",   null: false
    t.string   "use",         null: false
    t.string   "notes"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["extra_id"], name: "index_recipe_extras_on_extra_id", using: :btree
    t.index ["recipe_id"], name: "index_recipe_extras_on_recipe_id", using: :btree
  end

  create_table "recipe_fermentables", force: :cascade do |t|
    t.integer  "recipe_id",      null: false
    t.integer  "fermentable_id", null: false
    t.float    "amount",         null: false
    t.string   "use",            null: false
    t.string   "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["fermentable_id"], name: "index_recipe_fermentables_on_fermentable_id", using: :btree
    t.index ["recipe_id"], name: "index_recipe_fermentables_on_recipe_id", using: :btree
  end

  create_table "recipe_hops", force: :cascade do |t|
    t.integer  "recipe_id",  null: false
    t.integer  "hop_id",     null: false
    t.float    "amount",     null: false
    t.float    "time",       null: false
    t.string   "use",        null: false
    t.string   "form",       null: false
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["hop_id"], name: "index_recipe_hops_on_hop_id", using: :btree
    t.index ["recipe_id"], name: "index_recipe_hops_on_recipe_id", using: :btree
  end

  create_table "recipe_yeasts", force: :cascade do |t|
    t.integer  "recipe_id",  null: false
    t.integer  "yeast_id",   null: false
    t.string   "notes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_recipe_yeasts_on_recipe_id", using: :btree
    t.index ["yeast_id"], name: "index_recipe_yeasts_on_yeast_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.integer  "parent_id"
    t.integer  "user_id",              null: false
    t.integer  "equipment_profile_id", null: false
    t.string   "name",                 null: false
    t.float    "og",                   null: false
    t.float    "fg",                   null: false
    t.float    "ibu",                  null: false
    t.float    "color",                null: false
    t.float    "abv",                  null: false
    t.float    "balance",              null: false
    t.float    "batch_size",           null: false
    t.integer  "boil_time",            null: false
    t.float    "fermentation_temp",    null: false
    t.text     "notes"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["equipment_profile_id"], name: "index_recipes_on_equipment_profile_id", using: :btree
    t.index ["parent_id"], name: "index_recipes_on_parent_id", using: :btree
    t.index ["user_id"], name: "index_recipes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "yeasts", force: :cascade do |t|
    t.string   "name",        null: false
    t.float    "attenuation", null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
