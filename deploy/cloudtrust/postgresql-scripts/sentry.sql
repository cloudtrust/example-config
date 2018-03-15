CREATE USER sentry WITH PASSWORD 'sentry';
CREATE DATABASE sentry;
GRANT ALL ON DATABASE sentry TO sentry;
ALTER USER sentry WITH superuser;