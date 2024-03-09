class Project < ApplicationRecord
  has_many :drawings, dependent: :destroy
  belongs_to :user
  has_many :project_users
  has_many :users, through: :project_users
end
