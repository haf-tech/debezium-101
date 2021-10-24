/*
 * PostgreSQL script for the various use cases
 * - check the wal configuration
 * - create the table, inserts and updates
 * - set permissions
 */

/* expected value: logical */
show wal_level

/* NOT for PRODUCTION! Set the right permissions */
GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO repl;


/* Queries to create, insert and update */
CREATE TABLE ImportantEvents (
  id SERIAL,
  title varchar(30) NOT NULL,
  event_state varchar(5) NOT NULL,
  created_at timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id)
);

INSERT INTO ImportantEvents
(title, event_state, created_at)
VALUES('event1', '1', CURRENT_TIMESTAMP);

UPDATE ImportantEvents
SET title='event1', event_state='2', created_at=CURRENT_TIMESTAMP
WHERE id=1;



