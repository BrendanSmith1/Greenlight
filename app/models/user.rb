class User < ApplicationRecord
  has_many :projects
  
  has_many :project_users
  has_many :projects, through: :project_users
  has_many :drawings, through: :projects

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
