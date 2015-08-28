class AdminConfig < ActiveRecord::Base
  attr_accessor :meta_thumbnail

  has_attached_file :meta_thumbnail,
                    styles: {medium: '300x300>', thumb: '100x100>'},
                    default_url: 'lecture.jpg'
  validates_attachment_content_type :meta_thumbnail,
                                    content_type: /\Aimage\/.*\Z/
end
