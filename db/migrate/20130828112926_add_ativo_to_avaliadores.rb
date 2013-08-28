class AddAtivoToAvaliadores < ActiveRecord::Migration
  def change
  		add_column :avaliadores, :ativo, :boolean, :default => 1
  end
end
