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

ActiveRecord::Schema.define(version: 20150603230640) do

  create_table "atletas", force: :cascade do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "telefone"
    t.string   "data_nascimento"
    t.string   "cpf"
    t.string   "rg"
    t.float    "altura"
    t.float    "peso"
    t.string   "posicao_joga"
    t.string   "categoria"
    t.string   "alojamento_clube"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "clausulas", force: :cascade do |t|
    t.string   "titulo"
    t.string   "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "contratos", force: :cascade do |t|
    t.datetime "data_Inicio"
    t.datetime "data_Termino"
    t.integer  "atleta_id"
    t.string   "contrata"
    t.float    "valor"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "contratos", ["atleta_id"], name: "index_contratos_on_atleta_id"

  create_table "partidas", force: :cascade do |t|
    t.string   "nome"
    t.string   "tag"
    t.datetime "data"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
