class RenameColumnAtivoAtAvaliadores < ActiveRecord::Migration
  def change
  	remove_column :avaliadores, :ativo
  	add_column :avaliadores, :status, :boolean, :default => 1
  end
end
