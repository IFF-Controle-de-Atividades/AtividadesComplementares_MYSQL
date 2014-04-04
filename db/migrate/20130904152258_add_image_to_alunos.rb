class AddImageToAlunos < ActiveRecord::Migration
  def change
    add_column :alunos, :image, :string
  end
end
