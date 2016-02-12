PHP
===

Various images to run the unit tests.

Usage (from the phpBB root directory):
```
docker run -d --name mysql -e MYSQL_ROOT_PASSWORD='' -e MYSQL_DATABASE='phpbb_tests' -e MYSQL_ALLOW_EMPTY_PASSWORD='yes' mysql
docker run --rm --link mysql:mysql aanand/wait
docker run \
    --rm \
    -ti \
    --link mysql:mysql \
    --env PHPBB_TEST_DBMS="phpbb\db\driver\mysql" \
    --env PHPBB_TEST_DBHOST="mysql" \
    --env PHPBB_TEST_DBPORT="3306" \
    --env PHPBB_TEST_DBNAME="phpbb_tests" \
    --env PHPBB_TEST_DBUSER="root" \
    --env PHPBB_TEST_DBPASSWD="" \
    --env PHPBB_TEST_TABLE_PREFIX="phpbb_" \
    --volume $(pwd):/data \
    --workdir /data \
    phpbb/php-5.6-mysql php -d memory_limit=-1 phpBB/vendor/bin/phpunit --group __nogroup__ --log-junit build/logs/phpunit.xml
```
