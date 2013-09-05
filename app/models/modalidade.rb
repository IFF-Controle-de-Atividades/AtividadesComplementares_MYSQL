class Modalidade < ActiveRecord::Base
  attr_accessible :title

  belongs_to :atividade
end
