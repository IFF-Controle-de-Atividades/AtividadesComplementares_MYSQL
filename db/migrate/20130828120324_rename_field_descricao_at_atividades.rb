class RenameFieldDescricaoAtAtividades < ActiveRecord::Migration
  def change
  	rename_column :atividades, :descricao, :horasganhas
  end
end
