class AddModalidadeToAtividades < ActiveRecord::Migration
  def change
  	add_column :atividades,:modalidade,:string
  end
end
