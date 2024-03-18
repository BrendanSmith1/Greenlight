class RemoveFileFromDrawings < ActiveRecord::Migration[7.1]
  def change
    remove_column :drawings, :file, :string
  end
end
