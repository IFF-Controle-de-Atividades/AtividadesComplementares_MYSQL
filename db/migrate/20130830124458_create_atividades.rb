class CreateAtividades < ActiveRecord::Migration
  def change
    create_table :atividades do |t|
      t.string :title
      t.float :horasganhas
      t.date :inicio
      t.date :termino

      t.timestamps
    end
  end
end
