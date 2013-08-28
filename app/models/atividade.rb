class Atividade < ActiveRecord::Base
  attr_accessible :nome, :modalidade, :descricao, :inicio, :termino

  validates_presence_of :nome, :modalidade
  validates_length_of :descricao, :in => 20..300, :allow_false=>true
end
