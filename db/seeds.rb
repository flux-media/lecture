User.create(email: 'test1@test.com', password: 'test1', name: '이낑깡')
User.create(email: 'test2@test.com', password: 'test2', name: '김사과')
User.create(email: 'test3@test.com', password: 'test3', name: '무지개')
User.create(email: 'test4@test.com', password: 'test4', name: '아파트')

User.create(email: 'slave@avengerschool.com', password: 'admin',
            name: '관리자', is_admin: true)

Teacher.create(name: '이낑깡',
               blog_url: 'http://www.naver.com/',
               facebook_url: 'http://www.naver.com/',
               twitter_id: 'gang',
               description: '낑깡을 좋아합니다.',
               thumbnail: File.open('app/assets/images/boy.png'))

Category.create(name: '비즈니스', slug: 'business')
Category.create(name: '경제', slug: 'economy')

Course.create(teacher_id: 1, is_public: true, slug: 'test-1',
              title: '메모와 노트를 활용한 생각정리 기술1', location: '강남 토즈타워점',
              date: Date.new(2016, 4, 1),
              detail:
                  '영락과 그들에게 황금시대의 가장 이상의 뿐이다. 없는 얼음이 인간이 영원히 부패뿐이다.
가치를 속잎나고, 얼음 사랑의 사막이다. 인생을 몸이 목숨을 피부가 열매를 가치를 인간
의 것이다. 주는 따뜻한 뜨고, 있는 행복스럽고 품었기 그것을 이것이다. 피부가 별과 이상이
있는 철환하였는가 청춘의 청춘 것이다. 천하를 꽃이 미묘한 너의 못하다 길을 기관과 그들은
교향악이다. 풍부하게 가진 곧 가슴이 얼음에 곳으로 봄바람이다. 전인 살았으며, 웅대한 말이다.
심장은 유소년에게서 별과 커다란 이것이다.',
              thumbnail: File.open('app/assets/images/lecture.jpg'))

Course.create(teacher_id: 1, is_public: true, slug: 'test-2',
              title: '메모와 노트를 활용한 생각정리 기술2', location: '강남 토즈타워점',
              date: Date.new(2016, 4, 1),
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
              thumbnail: File.open('app/assets/images/lecture.jpg'))

Course.create(teacher_id: 1, is_public: true, slug: 'test-3',
              title: '매스니치', location: '강남 토즈타워점',
              date: Date.new(2016, 4, 1),
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
              thumbnail: File.open('app/assets/images/lecture.jpg'))

Course.create(teacher_id: 1, is_public: true, slug: 'test-4',
              title: '업무에 스마트 더하기', location: '강남 토즈타워점',
              date: Date.new(2016, 4, 1),
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
              thumbnail: File.open('app/assets/images/lecture.jpg'))

CategoriesCourse.create(category_id: 1, course_id: 1)
CategoriesCourse.create(category_id: 2, course_id: 1)
CategoriesCourse.create(category_id: 1, course_id: 2)
CategoriesCourse.create(category_id: 2, course_id: 3)
CategoriesCourse.create(category_id: 2, course_id: 4)

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