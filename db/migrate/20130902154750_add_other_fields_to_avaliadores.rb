class AddOtherFieldsToAvaliadores < ActiveRecord::Migration
  def change
  	add_column :avaliadores,:nome,:string
  	add_column :avaliadores,:matricula,:string
  	add_column :avaliadores,:titulacao,:string
  	add_column :avaliadores,:sexo,:string
  	add_column :avaliadores,:admin,:boolean, :default => 0
  	add_column :avaliadores,:status,:boolean, :default => 1
  end
end