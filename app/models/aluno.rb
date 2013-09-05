#--*-- coding:utf-8 --*--
class Aluno < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  attr_accessible :nome, :sexo, :curso,:periodo,:matricula,:email, :password, :password_confirmation, :remember_me, :image
  mount_uploader :image, ImageUploader

  has_many :atividades
  
  validates_presence_of :nome, :sexo, :curso, :matricula
 
  validates_length_of   :nome, :in => 10..30, :allow_blank => false
  validates_length_of   :matricula, :in => 12..20, :allow_blank => false
 
  validates_uniqueness_of :nome, :matricula, :email

  def contar_horas_enviadas(aluno_atual)
    aluno = aluno_atual  
    total_horas = Atividade.where(:aluno_id => aluno)
    total_horas = total_horas.sum(:horasganhas)
    if total_horas >= 360 
         return "Horas cumpridas = #{$total_horas} - Você possui horas suficientes!"
     else 
         return "Horas cumpridas= #{$total_horas} - Você não possui horas o suficiente! "
     end    
  end

  def contar_horas_aceitas(aluno_atual)
    aluno = aluno_atual
    total_horas = Atividade.where(:aluno_id => aluno)
    total_horas = total_horas.sum(:horas_aceitas)
    if total_horas >= 360
       return "Total de Horas = #{total_horas} - Você possui horas suficientes!"
    else
       return "Total de Horas= #{total_horas} - Você não possui horas o suficiente! "
    end
  end
  
  scope :buscar_pelo_nome, lambda{|nome| where(:nome => nome)}
end
