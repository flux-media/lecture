# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
User.create(email: 'test1@test.com', password: 'test1', name: 'Teacher1')
User.create(email: 'test2@test.com', password: 'test2', name: 'Student1')
Teacher.create(description: 'I\'m a teacher.', user_id: 1)
Student.create(user_id: 2)

Program.create(name: 'Do something valuable.')
Program.create(name: 'Don\'t do something bad.')

Course.create(name: 'Write something.')
Course.create(name: 'Ride something.')
Course.create(name: 'Stop smoking.')
Course.create(name: 'Stop drinking.')

CoursesProgram.create(program_id: 1, course_id: 1)
CoursesProgram.create(program_id: 1, course_id: 2)
CoursesProgram.create(program_id: 1, course_id: 3)
CoursesProgram.create(program_id: 2, course_id: 3)
CoursesProgram.create(program_id: 2, course_id: 4)

Lesson.create(name: 'Read first.', held_at: Date.new(), course_id: 1)
Lesson.create(name: 'Read more.', held_at: Date.new(), course_id: 1)
Lesson.create(name: 'Write little.', held_at: Date.new(), course_id: 1)
Lesson.create(name: 'Choose your bicycle.', held_at: Date.new(), course_id: 2)
Lesson.create(name: 'Get your gear.', held_at: Date.new(), course_id: 2)
Lesson.create(name: 'Smoke alternatives.', held_at: Date.new(), course_id: 3)
Lesson.create(name: 'Drink water.', held_at: Date.new(), course_id: 4)

LessonsTeacher.create(lesson_id: 1, teacher_id: 1)
LessonsTeacher.create(lesson_id: 2, teacher_id: 1)
LessonsTeacher.create(lesson_id: 3, teacher_id: 1)
LessonsTeacher.create(lesson_id: 4, teacher_id: 1)
LessonsTeacher.create(lesson_id: 5, teacher_id: 1)
LessonsTeacher.create(lesson_id: 6, teacher_id: 1)
LessonsTeacher.create(lesson_id: 7, teacher_id: 1)