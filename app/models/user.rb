class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  has_many :questions
  has_many :answer, :through => :questions
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates :email, :presence => true, :uniqueness => true
  validates :name, :presence => true
end
