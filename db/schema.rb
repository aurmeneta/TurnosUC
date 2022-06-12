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

ActiveRecord::Schema.define(version: 2022_06_12_034151) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "mensajes", force: :cascade do |t|
    t.string "contenido"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "usuario_id"
    t.bigint "turno_id"
    t.index ["turno_id"], name: "index_mensajes_on_turno_id"
    t.index ["usuario_id"], name: "index_mensajes_on_usuario_id"
  end

  create_table "notificaciones", force: :cascade do |t|
    t.string "contenido"
    t.boolean "visto", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "usuario_id"
    t.bigint "turno_id"
    t.index ["turno_id"], name: "index_notificaciones_on_turno_id"
    t.index ["usuario_id"], name: "index_notificaciones_on_usuario_id"
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
    t.string "imagen_perfil"
    t.string "direccion", null: false
    t.string "telefono", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_usuarios_on_email", unique: true
    t.index ["reset_password_token"], name: "index_usuarios_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "mensajes", "turnos", on_delete: :cascade
  add_foreign_key "mensajes", "usuarios", on_delete: :cascade
  add_foreign_key "notificaciones", "turnos", on_delete: :cascade
  add_foreign_key "notificaciones", "usuarios", on_delete: :cascade
  add_foreign_key "resenas", "usuarios", column: "autor_id", on_delete: :cascade
  add_foreign_key "resenas", "usuarios", on_delete: :cascade
  add_foreign_key "solicituds", "turnos", on_delete: :cascade
  add_foreign_key "solicituds", "usuarios", on_delete: :cascade
  add_foreign_key "turnos", "usuarios", on_delete: :cascade
end
