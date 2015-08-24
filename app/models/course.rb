class Course < ActiveRecord::Base
  attr_accessor :teachers

  belongs_to :program
  has_many :course_schedules
  has_many :lessons, -> { order(:order) }

  has_attached_file :thumbnail, styles: {medium: '300x300>', thumb: '100x100>'},
                    default_url: 'lecture.jpg'
  validates_attachment_content_type :thumbnail, content_type: /\Aimage\/.*\Z/
end
