class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.string :nome
      t.string :modalidade
      t.text :descricao
      t.date :inicio
      t.date :termino
      
      t.timestamps
    end
  end
end
