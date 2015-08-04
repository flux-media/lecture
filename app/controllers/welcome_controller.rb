class WelcomeController < ApplicationController
	def index
		@is_banner_visible = true

		@programs = Program.all

		@programs.each_with_index do |program, index|
			if index % 2 === 0
				program.style_class = 'pricing-table-free'
			else
				program.style_class = 'pricing-table-biz'
			end

			program.courses.each do |course|
				teachers_array = Array.new

				course.lessons.each do |lesson|
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

				course.teachers = teachers_array

			end
		end
	end
end
