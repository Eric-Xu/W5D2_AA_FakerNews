module ApplicationHelper
  def login_toggle_tag
    html = ""
    if logged_in?
      html << current_user.username
      html << (link_to 'Log out', session_path, :method => :delete)
    else
      html << (link_to 'Log in', new_session_path)
    end
    html.html_safe
  end

  def flash_alerts
    html = ""
    if flash.notice
      html << "<div class='alert alert-success'>#{flash.notice}</div>"
    end
    if flash[:error]
      flash[:error].each do |error|
        html << "<div class='alert alert-error'>#{error}</div>"
      end
    end
    html.html_safe
  end
end
