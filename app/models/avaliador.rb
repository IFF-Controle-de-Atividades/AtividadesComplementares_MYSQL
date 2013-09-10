class Avaliador < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nome, :titulacao, :matricula, :sexo, :admin, :status, :image
  # attr_accessible :title, :body
  
  validates_presence_of :nome, :sexo, :titulacao, :matricula

  validates_length_of   :nome, :in => 10..30, :allow_blank => false
  validates_length_of   :titulacao, :in => 10..30, :allow_blank => true
  validates_length_of   :matricula, :in => 12..20, :allow_blank => false

  validates_uniqueness_of :nome, :email, :matricula

  mount_uploader :image, ImageUploader
  
  has_many :atividades
end