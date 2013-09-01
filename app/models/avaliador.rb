class Avaliador < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nome, :titulacao, :matricula, :sexo, :admin, :status
  # attr_accessible :title, :body


  validates_presence_of :nome, :sexo, :titulacao, :matricula

  validates_length_of   :nome, :maximum=> 50
  validates_length_of   :titulacao, :maximum=>80
  validates_length_of   :matricula,:maximum=>12

  validates_uniqueness_of :nome, :email, :matricula
end