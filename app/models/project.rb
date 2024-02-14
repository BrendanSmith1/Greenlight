class Project < ApplicationRecord
  has_many :drawings
  belongs_to :user
end
