module ApplicationHelper
  def banner_thumbnail_url(thumbnail_url)
    content_for :thumbnail_url, thumbnail_url.to_s
  end

  def meta_author(author)
    content_for :meta_author, author.to_s
  end

  def meta_title(title)
    content_for :meta_title, title.to_s
  end

  def meta_description(description)
    content_for :meta_description, description.to_s
  end

  def meta_og_type(type)
    content_for :meta_og_type, type.to_s
  end

  # TODO: Let admin manage this.
  def default_thumbnail
    'https://upload.wikimedia.org/wikipedia/commons/3/34/Math_lecture_at_TKK.JPG'
  end

  # TODO: Let admin manage this.
  def meta_fb_admins
    '1544971625'
  end

  # TODO: Let admin manage this.
  def meta_fb_app_id
    '494648400689612'
  end

  # TODO: Let admin manage this.
  def meta_twitter_site
    'default'
  end

  # TODO: Let admin manage this.
  def meta_og_article_publisher
    'https://www.facebook.com/scotchdevelopment'
  end

  # TODO: Let admin manage this.
  def meta_publisher
    'https://plus.google.com/+ScotchIo/'
  end

  # TODO: Let admin manage this.
end
