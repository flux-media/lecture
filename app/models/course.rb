class Course < ActiveRecord::Base
  has_many :categories_courses
  has_many :categories, through: :categories_courses
  belongs_to :teacher

  has_attached_file :thumbnail, styles: {medium: '600x600>', thumb: '300x300>'},
                    default_url: 'lecture.jpg'
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
