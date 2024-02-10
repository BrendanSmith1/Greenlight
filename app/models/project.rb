class Project < ApplicationRecord
  has_many :drawings
  has_many :access_lists
  has_many :users, through: :access_lists
end
