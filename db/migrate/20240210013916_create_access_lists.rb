class CreateAccessLists < ActiveRecord::Migration[7.1]
  def change
    create_table :access_lists do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :project, null: false, foreign_key: true

      t.timestamps
    end
  end
end
