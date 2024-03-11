class AddEmailNotificationsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :notify_when_added_to_project, :boolean, default: true
    add_column :users, :notify_when_drawing_added_to_project, :boolean, default: true
    add_column :users, :notify_when_drawing_updated_on_project, :boolean, default: true
  end
end
