DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS question_follows;



CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname VARCHAR(255) NOT NULL,
  lname VARCHAR(255)
);

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  body TEXT,
  user_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE question_follows (
  id INTEGER PRIMARY KEY,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  parent_id INTEGER,
  body TEXT,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_id) REFERENCES replies(id)
);

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  question_like INTEGER,
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,

  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname,lname)
VALUES
  ('Steve','Jobs'),
  ('Bill', 'Gates'),
  ('J.K', 'Rowling'),
  ('Darth','Vader'),
  ('Luke','Skywalker'),
  ('Genji','Shimada');


INSERT INTO
  questions(title, body, user_id)
VALUES
  ('Who dis', 'New phone', (SELECT id FROM users WHERE fname = 'Steve' AND lname = 'Jobs')),
  ('wemofeg','onengei', (SELECT id FROM users Where fname = 'Bill' AND lname = 'Gates')),
  ('Hanzo OP','Unfair!', 6),
  ('I NEED','HEALING', 6),
  ('GET OFF','GENJI!', 6),
  ('DPS','Sucks', 6);



INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE users.fname = 'Steve' AND users.lname = 'Jobs'),
    (SELECT id from questions WHERE questions.title = 'Who dis')),
  ((SELECT id FROM users WHERE users.fname = 'Steve' AND users.lname = 'Jobs'),
    (SELECT id from questions WHERE questions.title = 'wemofeg')),
  ((SELECT id FROM users WHERE users.fname = 'Bill' AND users.lname = 'Gates'),
    (SELECT id from questions WHERE questions.title = 'wemofeg')),
  ((SELECT id FROM users WHERE users.fname = 'J.K' AND users.lname = 'Rowling'),
    (SELECT id from questions WHERE questions.title = 'Who dis')),
  ((SELECT id FROM users WHERE users.fname = 'J.K' AND users.lname = 'Rowling'),
    (SELECT id from questions WHERE questions.title = 'wemofeg'));

INSERT INTO
  replies(question_id,user_id,parent_id,body)
VALUES
  ((SELECT id from questions WHERE questions.title = 'wemofeg'),
    (SELECT id FROM users WHERE users.fname = 'J.K' AND users.lname = 'Rowling'),
    NULL,
    'This is a wonderful question');

INSERT INTO
  replies(question_id,user_id,parent_id,body)
VALUES
  ((SELECT id from questions WHERE questions.title = 'wemofeg'),
    (SELECT id FROM users WHERE users.fname = 'Bill' AND users.lname = 'Gates'),
    (SELECT id from replies WHERE replies.body = 'This is a wonderful question'),
      'No, its not. Apple sucks');

  INSERT INTO
    question_likes(question_like, user_id, question_id)
  VALUES -- At some point it's better to just hard code numbers
    (1, 1, 1),
    (1, 1, 2),
    (1, 3, 1),
    (1, 3, 2),
    (1, 1, 3),
    (1, 2, 3),
    (1, 3, 3),
    (1, 4, 3),
    (1, 1, 4),
    (1, 2, 4),
    (1, 3, 4),
    (1, 4, 4),
    (1, 5, 4),
    (1, 6, 4),
    (1, 1, 5),
    (1, 2, 5),
    (1, 3, 6);
