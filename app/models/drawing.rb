class Drawing < ApplicationRecord
  belongs_to :project
  has_one_attached :file
  has_paper_trail ignore: [:created_at, :updated_at, :project_id]
end
