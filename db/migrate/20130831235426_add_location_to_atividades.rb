class AddLocationToAtividades < ActiveRecord::Migration
  def change
  	add_column :atividades,:location,:string, :limit => 2
  end
end
