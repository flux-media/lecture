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
4. Add `SECRET_KEY_BASE`, `LECTURE_DATABASE_PRODUCTION`, 
    `LECTURE_DATABASE_USERNAME`, `LECTURE_DATABASE_PASSWORD`,
    `LECTURE_DATABASE_HOST` environment variables to `~/.bashrc`.
    (Don't forget to type `source ~/.bashrc` to refresh.)
4-1. When using Apache, you [may need to add
    environment variables to `/etc/apache2/envvars`](http://stackoverflow.com/questions/25429715/missing-secret-key-base-for-production-environment/25438346#25438346).
5. Migrate the database with seeds.
6. Restart your web server. 
