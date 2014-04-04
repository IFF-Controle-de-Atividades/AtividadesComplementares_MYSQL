class AddLocationToAtividades < ActiveRecord::Migration
  def change
  	add_column :atividades,:location,:string
  end
end
