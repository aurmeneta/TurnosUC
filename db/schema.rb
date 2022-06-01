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

ActiveRecord::Schema.define(version: 2022_05_31_204737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mensajes", force: :cascade do |t|
    t.string "contenido"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "usuario_id"
    t.bigint "turno_id"
    t.index ["turno_id"], name: "index_mensajes_on_turno_id"
    t.index ["usuario_id"], name: "index_mensajes_on_usuario_id"
  end

  create_table "resenas", force: :cascade do |t|
    t.integer "calificacion"
    t.string "contenido"
    t.integer "usuario_id"
    t.integer "autor_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "solicituds", force: :cascade do |t|
    t.string "descripcion"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "turno_id"
    t.bigint "usuario_id"
    t.index ["turno_id"], name: "index_solicituds_on_turno_id"
    t.index ["usuario_id"], name: "index_solicituds_on_usuario_id"
  end

  create_table "turnos", force: :cascade do |t|
    t.string "dia"
    t.string "direccion_salida"
    t.time "hora_salida"
    t.string "tipo"
    t.integer "cupos"
    t.string "campus"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "usuario_id"
    t.string "comuna"
    t.datetime "fecha"
    t.index ["usuario_id"], name: "index_turnos_on_usuario_id"
  end

  create_table "usuarios", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "nombre", null: false
    t.string "imagen_perfil", null: false
    t.string "direccion", null: false
    t.string "telefono", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "mensajes", "turnos", on_delete: :cascade
  add_foreign_key "mensajes", "usuarios", on_delete: :cascade
  add_foreign_key "resenas", "usuarios", column: "autor_id", on_delete: :cascade
  add_foreign_key "resenas", "usuarios", on_delete: :cascade
  add_foreign_key "solicituds", "turnos", on_delete: :cascade
  add_foreign_key "solicituds", "usuarios", on_delete: :cascade
  add_foreign_key "turnos", "usuarios", on_delete: :cascade
end
