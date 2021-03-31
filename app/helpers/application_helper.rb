module ApplicationHelper
  def nav
    render 'shared/nav' if current_user
  end

  def login_menu
    render 'shared/login' unless current_user
  end
end
