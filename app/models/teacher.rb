class Teacher < ActiveRecord::Base
  has_attached_file :thumbnail, styles: {medium: '600x600>', thumb: '300x300>'},
                    default_url: 'boy.png'
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
