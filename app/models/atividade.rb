class Atividade < ActiveRecord::Base
  attr_accessible :nome, :modalidade, :horasganhas, :inicio, :termino

  validates_presence_of :nome, :modalidade, :horasganhas
  validates_length_of :descricao, :in => 20..300, :allow_false=>true
end
