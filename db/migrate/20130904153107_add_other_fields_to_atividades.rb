class AddOtherFieldsToAtividades < ActiveRecord::Migration
  def change
    add_column :atividades, :aluno_id, :integer
    add_column :atividades, :designada_em, :date
    add_column :atividades, :avaliador_id, :integer
    add_column :atividades, :avaliada, :boolean
    add_column :atividades, :horas_aceitas, :float
    add_column :atividades, :justificativa, :string
  end
end
