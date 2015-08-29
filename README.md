#Lecture

##Prerequisites

1. [Redis](http://redis.io/)
2. [Bower](http://bower.io/)
3. [ImageMagick](http://www.imagemagick.org/script/index.php)
4. [MySQL](https://www.mysql.com/)

##Installation

1. Install all prerequisites.
2. Type `bower install` at the project root
    in order to install javascript libraries.
3. Type `bundle install` at the project root.
3. Add `SECRET_KEY_BASE`, `LECTURE_DATABASE_PRODUCTION`, 
    `LECTURE_DATABASE_USERNAME`, `LECTURE_DATABASE_PASSWORD`,
    `LECTURE_DATABASE_HOST` environment variables to `~/.bashrc`.
    (Don't forget to type `source ~/.bashrc` to refresh.)
4. Migrate the database with seeds.
5. Restart your web server. 
