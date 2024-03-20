class Drawing < ApplicationRecord
  belongs_to :project
  has_one_attached :file
  has_paper_trail
end
