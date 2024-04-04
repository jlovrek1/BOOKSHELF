CREATE USER bookshelf_owner
WITH PASSWORD 'bookshelf';

GRANT ALL
ON ALL TABLES IN SCHEMA public
TO bookshelf_owner;

GRANT ALL
ON ALL SEQUENCES IN SCHEMA public
TO bookshelf_owner;

CREATE USER bookshelf_appuser
WITH PASSWORD 'bookshelf';

GRANT SELECT, INSERT, UPDATE, DELETE
ON ALL TABLES IN SCHEMA public
TO bookshelf_appuser;

GRANT USAGE, SELECT
ON ALL SEQUENCES IN SCHEMA public
TO bookshelf_appuser;