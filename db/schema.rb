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

ActiveRecord::Schema.define(version: 2019_02_04_231738) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "contributions", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "student_id"
    t.index ["project_id"], name: "index_contributions_on_project_id"
    t.index ["student_id"], name: "index_contributions_on_student_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "slug"
    t.string "img_url"
    t.string "live_url"
    t.string "frontend_repo"
    t.string "backend_repo"
  end

  create_table "students", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "slug"
    t.string "img_url"
    t.string "github_username"
    t.boolean "graduated"
  end

  add_foreign_key "contributions", "projects"
  add_foreign_key "contributions", "students"
end
