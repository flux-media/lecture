User.create(email: 'test1@test.com', password: 'test1', name: '이낑깡')
Teacher.create(description: '낑깡을 잘 먹는 이낑깡 선생님', user_id: 1)
User.create(email: 'test2@test.com', password: 'test2', name: '김사과')
Teacher.create(description: '사과 같은 선생님 김사과', user_id: 2)
User.create(email: 'test3@test.com', password: 'test3', name: '무지개')
Teacher.create(description: '일곱 빛깔의 사나이', user_id: 3)
User.create(email: 'test4@test.com', password: 'test4', name: '아파트')
Teacher.create(description: '별빛이 흐르는 다리를 건너 바람 부는 갈대 숲을 지나 언제나 나를 언제나 나를 기다리던 너의 선생님', user_id: 4)

User.create(email: 'admin@test.com', password: 'admin',
            name: '관리자', is_admin: true)
Student.create(user_id: 5)

location = Location.create(name: '강남 토즈 1호점 101호',
                           latitude: 37.4997055, longitude: 126.9913284,
                           phone_number: '02-1234-5678',
                           address: '서울시 강남구 서초동',
                           website: 'http://www.toz.co.kr/')

Category.create(name: '비즈니스')
Program.create(name: '생각정리 + 기획', category_id: 1)

Course.create(name: '메모와 노트를 활용한 생각정리 기술1',
              detail:
                  '영락과 그들에게 황금시대의 가장 이상의 뿐이다. 없는 얼음이 인간이 영원히 부패뿐이다.
가치를 속잎나고, 얼음 사랑의 사막이다. 인생을 몸이 목숨을 피부가 열매를 가치를 인간
의 것이다. 주는 따뜻한 뜨고, 있는 행복스럽고 품었기 그것을 이것이다. 피부가 별과 이상이
있는 철환하였는가 청춘의 청춘 것이다. 천하를 꽃이 미묘한 너의 못하다 길을 기관과 그들은
교향악이다. 풍부하게 가진 곧 가슴이 얼음에 곳으로 봄바람이다. 전인 살았으며, 웅대한 말이다.
심장은 유소년에게서 별과 커다란 이것이다.

놀이 생생하며, 새가 인생에 설산에서 뿐이다. 장식하는 주는 동산에는 얼마나 있는가?
우리는 품으며, 노년에게서 싸인 아니한 수 약동하다. 우리의 거선의 어디 사막이다. 쓸쓸한
 속에 아니더면, 꾸며 그들은 그들의 속에서 못할 이것이다. 발휘하기 용기가 피가 영락과
얼마나 쓸쓸한 이상의 있으랴? 반짝이는 곧 생의 온갖 몸이 품고 것이다. 눈에 품으며,
인생에 인간은 위하여서. 우리의 거친 붙잡아 타오르고 것은 길지 소금이라 끓는다.
아름답고 이것을 안고, 때문이다. 목숨이 없는 실로 내려온 그들의 수 봄바람이다.',
              thumbnail: File.open('app/assets/images/lecture.jpg'), program_id: 1)
Lesson.create(name: '메모를 하자.', course_id: 1, teacher_id: 1, order: 0)
Lesson.create(name: '노트를 쓰자.', course_id: 1, teacher_id: 1, order: 1)
Lesson.create(name: '마무리', course_id: 1, teacher_id: 1, order: 2)

CourseSchedule.create(order: 1, course_id: 1)
LessonSchedule.create(course_schedule_id: 1, lesson_id: 1,
                      held_at: DateTime.yesterday, location: location)
LessonSchedule.create(course_schedule_id: 1, lesson_id: 2,
                      held_at: DateTime.now, location: location)
LessonSchedule.create(course_schedule_id: 1, lesson_id: 3,
                      held_at: DateTime.tomorrow, location: location)

Course.create(name: '메모와 노트를 활용한 생각정리 기술2',
              detail:
                  '영락과 그들에게 황금시대의 가장 이상의 뿐이다. 없는 얼음이 인간이 영원히 부패뿐이다.
가치를 속잎나고, 얼음 사랑의 사막이다. 인생을 몸이 목숨을 피부가 열매를 가치를 인간
의 것이다. 주는 따뜻한 뜨고, 있는 행복스럽고 품었기 그것을 이것이다. 피부가 별과 이상이
있는 철환하였는가 청춘의 청춘 것이다. 천하를 꽃이 미묘한 너의 못하다 길을 기관과 그들은
교향악이다. 풍부하게 가진 곧 가슴이 얼음에 곳으로 봄바람이다. 전인 살았으며, 웅대한 말이다.
심장은 유소년에게서 별과 커다란 이것이다.

놀이 생생하며, 새가 인생에 설산에서 뿐이다. 장식하는 주는 동산에는 얼마나 있는가?
우리는 품으며, 노년에게서 싸인 아니한 수 약동하다. 우리의 거선의 어디 사막이다. 쓸쓸한
 속에 아니더면, 꾸며 그들은 그들의 속에서 못할 이것이다. 발휘하기 용기가 피가 영락과
얼마나 쓸쓸한 이상의 있으랴? 반짝이는 곧 생의 온갖 몸이 품고 것이다. 눈에 품으며,
인생에 인간은 위하여서. 우리의 거친 붙잡아 타오르고 것은 길지 소금이라 끓는다.
아름답고 이것을 안고, 때문이다. 목숨이 없는 실로 내려온 그들의 수 봄바람이다.',
              thumbnail: File.open('app/assets/images/lecture.jpg'), program_id: 1)
Lesson.create(name: '생각을 하자.', course_id: 2, teacher_id: 1, order: 0)

Program.create(name: '경영과 혁신', category_id: 1)
Course.create(name: '매스니치',
              detail:
                  '영락과 그들에게 황금시대의 가장 이상의 뿐이다. 없는 얼음이 인간이 영원히 부패뿐이다.
가치를 속잎나고, 얼음 사랑의 사막이다. 인생을 몸이 목숨을 피부가 열매를 가치를 인간
의 것이다. 주는 따뜻한 뜨고, 있는 행복스럽고 품었기 그것을 이것이다. 피부가 별과 이상이
있는 철환하였는가 청춘의 청춘 것이다. 천하를 꽃이 미묘한 너의 못하다 길을 기관과 그들은
교향악이다. 풍부하게 가진 곧 가슴이 얼음에 곳으로 봄바람이다. 전인 살았으며, 웅대한 말이다.
심장은 유소년에게서 별과 커다란 이것이다.

놀이 생생하며, 새가 인생에 설산에서 뿐이다. 장식하는 주는 동산에는 얼마나 있는가?
우리는 품으며, 노년에게서 싸인 아니한 수 약동하다. 우리의 거선의 어디 사막이다. 쓸쓸한
 속에 아니더면, 꾸며 그들은 그들의 속에서 못할 이것이다. 발휘하기 용기가 피가 영락과
얼마나 쓸쓸한 이상의 있으랴? 반짝이는 곧 생의 온갖 몸이 품고 것이다. 눈에 품으며,
인생에 인간은 위하여서. 우리의 거친 붙잡아 타오르고 것은 길지 소금이라 끓는다.
아름답고 이것을 안고, 때문이다. 목숨이 없는 실로 내려온 그들의 수 봄바람이다.',
              thumbnail: File.open('app/assets/images/lecture.jpg'), program_id: 2)
Lesson.create(name: '생각을 하자.', course_id: 3, teacher_id: 3, order: 0)

Category.create(name: '생산성')
Program.create(name: '스마트 워크', category_id: 2)
Course.create(name: '업무에 스마트 더하기',
              detail:
                  '영락과 그들에게 황금시대의 가장 이상의 뿐이다. 없는 얼음이 인간이 영원히 부패뿐이다.
가치를 속잎나고, 얼음 사랑의 사막이다. 인생을 몸이 목숨을 피부가 열매를 가치를 인간
의 것이다. 주는 따뜻한 뜨고, 있는 행복스럽고 품었기 그것을 이것이다. 피부가 별과 이상이
있는 철환하였는가 청춘의 청춘 것이다. 천하를 꽃이 미묘한 너의 못하다 길을 기관과 그들은
교향악이다. 풍부하게 가진 곧 가슴이 얼음에 곳으로 봄바람이다. 전인 살았으며, 웅대한 말이다.
심장은 유소년에게서 별과 커다란 이것이다.

놀이 생생하며, 새가 인생에 설산에서 뿐이다. 장식하는 주는 동산에는 얼마나 있는가?
우리는 품으며, 노년에게서 싸인 아니한 수 약동하다. 우리의 거선의 어디 사막이다. 쓸쓸한
 속에 아니더면, 꾸며 그들은 그들의 속에서 못할 이것이다. 발휘하기 용기가 피가 영락과
얼마나 쓸쓸한 이상의 있으랴? 반짝이는 곧 생의 온갖 몸이 품고 것이다. 눈에 품으며,
인생에 인간은 위하여서. 우리의 거친 붙잡아 타오르고 것은 길지 소금이라 끓는다.
아름답고 이것을 안고, 때문이다. 목숨이 없는 실로 내려온 그들의 수 봄바람이다.',
              thumbnail: File.open('app/assets/images/lecture.jpg'), program_id: 3)
Lesson.create(name: '생각을 하자.', course_id: 4, teacher_id: 4, order: 0)

PaymentState.create(name: '처리 중', key: 'pending')
PaymentState.create(name: '처리 완료', key: 'completed')
PaymentState.create(name: '처리 불가', key: 'not_completed')

Pricing.create(price: 100000, discount_price: 80000, point: 3)
Pricing.create(price: 150000, discount_price: 120000, point: 5)

AdminConfig.create(
    copyright: 'Copyright © 2015 PPSS',
    introduction: 'We all make choices, but in the end our choices make us.',
    meta_title: 'Lecture',
    meta_description: 'We all make choices, but in the end our choices make us.',
    meta_fb_admins: '1544971625',
    meta_fb_app_id: '494648400689612',
    meta_twitter_site: 'default',
    meta_og_article_publisher: 'default',
    meta_publisher: 'default',
    meta_thumbnail: File.open('app/assets/images/lecture.jpg'))