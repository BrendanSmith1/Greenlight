class AddFileToDrawings < ActiveRecord::Migration[7.1]
  def change
    add_column :drawings, :file, :string
  end
end
