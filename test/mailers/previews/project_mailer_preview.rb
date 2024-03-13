# Preview all emails at http://localhost:3000/rails/mailers/project_mailer
class ProjectMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/project_mailer/user_added_to_project
  def user_added_to_project
    ProjectMailer.with(project: Project.last, user: User.last, author: User.second).user_added_to_project
  end

  def drawing_added_to_project
    ProjectMailer.with(project: Project.last, user: User.last, drawing: Drawing.first,
      author: User.second).drawing_added_to_project
  end

  def drawing_updated_on_project
    ProjectMailer.with(project: Project.last, user: User.last, drawing: Drawing.first,
      author: User.second).drawing_updated_on_project
  end
end
