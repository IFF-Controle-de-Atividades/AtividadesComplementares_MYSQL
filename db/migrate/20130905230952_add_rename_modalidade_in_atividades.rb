class AddRenameModalidadeInAtividades < ActiveRecord::Migration
  def change
  	rename_column :atividades, :modalidade, :modalidade_id
  end
end
