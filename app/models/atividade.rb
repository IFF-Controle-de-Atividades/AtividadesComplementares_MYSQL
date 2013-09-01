class Atividade < ActiveRecord::Base
  attr_accessible :horasganhas, :inicio, :termino, :title, :modalidade, :location

  validates_presence_of :horasganhas, :title ,:location

  def full_name
  	"#{title} , #{location}"
  end
end