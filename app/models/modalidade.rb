class Modalidade < ActiveRecord::Base
  attr_accessible :title

  belongs_to :atividade
  validates_presence_of :title
end
