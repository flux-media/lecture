module ApplicationHelper
  def banner_thumbnail_url(thumbnail_url)
    content_for :thumbnail_url, thumbnail_url.to_s
  end

  def meta_author(author)
    content_for :meta_author, author.to_s
  end

  def meta_title(title)
    if title.to_s.size > 0
      content_for :meta_title, title.to_s + ' :: ' + @admin_config.meta_title
    else
      content_for :meta_title, @admin_config.meta_title
    end
  end

  def meta_description(description)
    content_for :meta_description, description.to_s
  end

  def meta_og_type(type)
    content_for :meta_og_type, type.to_s
  end
end
