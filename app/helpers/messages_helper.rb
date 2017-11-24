module MessagesHelper
  def recipients_options(chosen_recipient = nil)
    s = ''
    User.all.each do |user|
      if user.is_admin?
        s << "<option value='#{user.id}'  #{'selected' if user == chosen_recipient}>#{user.name}</option>"
      end
    end
    s.html_safe
    end
end
