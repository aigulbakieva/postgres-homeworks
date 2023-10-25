-- 1. Создать таблицу student с полями student_id serial, first_name varchar, last_name varchar, birthday date, phone varchar
CREATE TABLE student
(
	student_id serial,
	first_name varchar,
	last_name varchar,
	birthday date,
	phone varchar
);
SELECT * FROM student;

-- 2. Добавить в таблицу student колонку middle_name varchar
ALTER TABLE student ADD COLUMN middle_name varchar;

-- 3. Удалить колонку middle_name
ALTER TABLE student DROP COLUMN middle_name;

-- 4. Переименовать колонку birthday в birth_date
ALTER TABLE student RENAME COLUMN birthday TO birth_day;

-- 5. Изменить тип данных колонки phone на varchar(32)
ALTER TABLE student ALTER COLUMN phone SET DATA TYPE varchar(32);

-- 6. Вставить три любых записи с автогенерацией идентификатора
INSERT INTO student (first_name, last_name, birth_day, phone)
VALUES ('Dasha', 'Pirogova', '1997-01-07', '0504038');
INSERT INTO student (first_name, last_name, birth_day, phone)
VALUES ('Misha', 'Bublikov', '1993-11-09', '0577608');
INSERT INTO student (first_name, last_name, birth_day, phone)
VALUES ('Katya', 'Vatrushkina', '1995-04-19', '0705832');

SELECT * FROM student;

-- 7. Удалить все данные из таблицы со сбросом идентификатор в исходное состояние
TRUNCATE TABLE student RESTART IDENTITY;