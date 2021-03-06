module ApplicationHelper
  def full_title(page_title)
    base_title = "Suitefolio"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

  def current_user?(user)
  	user == current_user
  end

  def current_user=(user)
  	@current_user = user
  end
end