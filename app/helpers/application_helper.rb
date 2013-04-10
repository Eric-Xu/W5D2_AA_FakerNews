module ApplicationHelper
  def login_toggle_tag
    html = ""
    if logged_in?
      html << current_user.username + " | "
      html << (link_to 'Log out', session_path, :method => :delete)
    else
      html << (link_to 'Log in', new_session_path) + " | "
      html << (link_to 'Sign up', new_user_path)
    end
    html.html_safe
  end

  def flash_alerts
    html = ""
    if flash.notice
      html << "<div class='alert alert-success'>#{flash.notice}</div>"
    end
    if flash[:error]
      if flash[:error].is_a? Array
        flash[:error].each do |error|
          html << "<div class='alert alert-error'>#{error}</div>"
        end
      else
        html << "<div class='alert alert-error'>#{flash[:error]}</div>"
      end
    end
    html.html_safe
  end

  def url_with_protocol(url)
     /^http/.match(url) ? url : "http://#{url}"
   end
end
