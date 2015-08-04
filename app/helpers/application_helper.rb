module ApplicationHelper
	def banner_thumbnail_url(thumbnail_url)
	  content_for :thumbnail_url, thumbnail_url.to_s
	end
end
