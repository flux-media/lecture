class CoursesController < ApplicationController
	def show
		@is_banner_visible = true

		course_id = params[:id]
		@course = Course.find(course_id)
		teachers_array = Array.new

		@course.lessons.each do |lesson|
			lesson.teachers.each do |teacher|

				is_in_array = false

				teachers_array.each do |teacher_in_array|
					if teacher_in_array.id === teacher.id
						is_in_array = true
					end
				end

				unless is_in_array
					teachers_array.push(teacher)
				end

			end
		end

		@course.teachers = teachers_array
	end
end
