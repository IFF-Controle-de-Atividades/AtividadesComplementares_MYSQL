class AddReceiptToAtividades < ActiveRecord::Migration
  def change
    add_column :atividades, :comprovante, :string
  end
end
