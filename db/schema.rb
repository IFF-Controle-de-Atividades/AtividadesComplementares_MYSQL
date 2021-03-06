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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130905230952) do

  create_table "alunos", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "nome"
    t.string   "matricula"
    t.string   "curso"
    t.string   "periodo"
    t.string   "sexo"
    t.string   "image"
  end

  add_index "alunos", ["email"], :name => "index_alunos_on_email", :unique => true
  add_index "alunos", ["reset_password_token"], :name => "index_alunos_on_reset_password_token", :unique => true

  create_table "atividades", :force => true do |t|
    t.string   "title"
    t.float    "horasganhas"
    t.date     "inicio"
    t.date     "termino"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "location"
    t.string   "modalidade_id"
    t.integer  "aluno_id"
    t.date     "designada_em"
    t.integer  "avaliador_id"
    t.boolean  "avaliada"
    t.float    "horas_aceitas"
    t.string   "justificativa"
    t.string   "comprovante"
  end

  create_table "avaliadores", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "nome"
    t.string   "matricula"
    t.string   "titulacao"
    t.string   "sexo"
    t.boolean  "admin",                  :default => false
    t.boolean  "status",                 :default => true
    t.string   "image"
  end

  add_index "avaliadores", ["email"], :name => "index_avaliadores_on_email", :unique => true
  add_index "avaliadores", ["reset_password_token"], :name => "index_avaliadores_on_reset_password_token", :unique => true

  create_table "modalidades", :force => true do |t|
    t.string   "title"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
