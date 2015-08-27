module AdminHelper
  def admin_title(title)
    content_for :admin_title, title.to_s
  end

  def admin_subtitle(subtitle)
    content_for :admin_subtitle, subtitle.to_s
  end
end
