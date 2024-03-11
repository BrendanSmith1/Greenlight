class ProjectMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.project_mailer.user_added_to_project.subject
  #
  def user_added_to_project
    @user = params[:user]
    @project = params[:project]
    @author = params[:author]

    mail to: @user.email, subject: "You have been added to #{@project.name} by #{@author.first_name} #{@author.last_name}"
  end

  def drawing_added_to_project
    @user = params[:user]
    @project = params[:project]
    @drawing = params[:drawing]
    @author = params[:author]

    mail to: @user.email, subject: "Drawing added to #{@project.name}"
  end

  def drawing_updated_on_project
    @user = params[:user]
    @project = params[:project]
    @drawing = params[:drawing]
    @author = params[:author]

    mail to: @user.email, subject: "Drawing updated on #{@project.name}"
  end
end
