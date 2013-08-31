class Atividade < ActiveRecord::Base
  attr_accessible :horasganhas, :inicio, :termino, :title

  validates_presence_of :horasganhas, :title

  #def full_name
  #	"#{title} , #{location}"
  #end
end