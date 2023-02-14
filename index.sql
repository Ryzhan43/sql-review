CREATE TABLE Towns (
                       id SERIAL UNIQUE NOT NULL,
                       code VARCHAR(10) NOT NULL, -- not unique
                       article TEXT,
                       name TEXT NOT NULL -- not unique
);


insert into towns (
    code, article, name
)
select
    left(md5(i::text), 10),
    md5(random()::text),
    md5(random()::text)
from generate_series(1, 1000000) s(i);

select count(*)
FROM towns;

select *
from towns;

EXPLAIN ANALYZE
SELECT *
FROM towns
WHERE name = 'ba17178f22f6522d5a3c3df87f6f2c43';

EXPLAIN ANALYZE
SELECT *
FROM towns
WHERE id = 1232;

CREATE INDEX idx_towns_name ON towns(name);
CREATE INDEX idx_towns_article ON towns(article);

DROP INDEX IF EXISTS idx_towns_name;

SELECT
    tablename,
    indexname,
    indexdef
FROM
    pg_indexes
WHERE
        schemaname = 'public'
ORDER BY
    tablename,
    indexname;