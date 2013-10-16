class Avaliador < ActiveRecord::Base

  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :nome, :titulacao, :matricula, :sexo, :admin, :status, :image
  # attr_accessible :title, :body
  #attr_accessor :current_password
  
  validates_presence_of :nome, :matricula, :titulacao

  validates_length_of   :titulacao, :in => 4..30, :allow_blank => true
  validates_length_of   :matricula, :maximum=> 13, :allow_blank => false

  validates_uniqueness_of :nome, :email, :matricula

  mount_uploader :image, ImageUploader
  
  has_many :atividades


  def verify_password?(password)
    encryptor_class = Devise::Encryptors.const_get(Devise.encryptor.to_s.classify)
    encryptor_digest = encryptor_class.digest(password, Devise.stretches, self.password_salt, Devise.pepper)
    encryptor_digest == self.encrypted_password
  end
end