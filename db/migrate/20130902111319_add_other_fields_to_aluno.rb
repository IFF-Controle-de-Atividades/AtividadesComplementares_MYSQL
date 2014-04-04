class AddOtherFieldsToAluno < ActiveRecord::Migration
  def change
  	add_column :alunos,:nome,:string
  	add_column :alunos,:matricula,:string
  	add_column :alunos,:curso,:string
  	add_column :alunos,:periodo,:string
  	add_column :alunos,:sexo,:string
  end
end
