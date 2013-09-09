class Atividade < ActiveRecord::Base
  attr_accessible :horasganhas, :inicio, :termino, :title, :modalidade_id, :location, :aluno_id, :avaliador_id, :designada_em, :avaliada, :horas_aceitas, :justificativa, :comprovante
  mount_uploader :comprovante, ComprovanteUploader
  
  validates_presence_of :horasganhas, :title ,:location

  belongs_to :aluno
  has_many :modalidades
  belongs_to :avaliador
  belongs_to :modalidade

  def full_name
  	"#{title} , #{location}"
  end
end