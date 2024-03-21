class Drawing < ApplicationRecord
  belongs_to :project
  has_one_attached :file
  has_paper_trail ignore: [:created_at, :updated_at, :project_id]

  # Override the update method to track changes to the file using PaperTrail - CHATGPT Idea
  # def update(attributes)
    # previous_file = self.file.attachment.blob.filename.to_s if self.file.attachment.present?

    # super

  #   current_file = self.file.attachment.blob.filename.to_s if self.file.attachment.present?

  #   if previous_file != current_file
  #     # Track changes to the file using PaperTrail
  #     PaperTrail.request(enabled: false) do
  #       # Manually record changes to the file in PaperTrail
  #       self.versions.create(
  #         event: 'update',
  #         whodunnit: PaperTrail.request.whodunnit,
  #         object_changes: { file: [previous_file, current_file] }
  #       )
  #     end
  #   end
  # end
end
