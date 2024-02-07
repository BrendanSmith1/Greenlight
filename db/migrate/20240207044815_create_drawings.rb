class CreateDrawings < ActiveRecord::Migration[7.1]
  def change
    create_table :drawings do |t|
      t.string :name
      t.string :number
      t.string :revision

      t.timestamps
    end
  end
end
