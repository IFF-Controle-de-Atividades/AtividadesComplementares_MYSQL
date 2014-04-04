class AddImageToAvaliadores < ActiveRecord::Migration
  def change
    add_column :avaliadores, :image, :string
  end
end
