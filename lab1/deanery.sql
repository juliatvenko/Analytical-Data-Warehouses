PRAGMA foreign_keys = ON;

--Faculty table
CREATE TABLE Faculty (
    facultyID INTEGER PRIMARY KEY AUTOINCREMENT,
    denomination TEXT NOT NULL,
    facultyName TEXT NOT NULL
);

-- Department table
CREATE TABLE Department (
    departmentID INTEGER PRIMARY KEY AUTOINCREMENT,
    departmentName TEXT NOT NULL,
    facultyID INTEGER NOT NULL,
    FOREIGN KEY(facultyID) REFERENCES Faculty(facultyID) ON DELETE CASCADE
);

--Qualification table
CREATE TABLE Qualification (
    qualificationID INTEGER PRIMARY KEY AUTOINCREMENT,
    levelQualification TEXT NOT NULL,
    levelEducation TEXT NOT NULL,
    specialityCredits INTEGER NOT NULL
);

-- Speciality table
CREATE TABLE Speciality (
    specialityID INTEGER PRIMARY KEY AUTOINCREMENT,
    specialityName TEXT NOT NULL,
    departmentID INTEGER NOT NULL,
    qualificationID INTEGER NOT NULL,
    enrollmentStatus TEXT NOT NULL,
    FOREIGN KEY(departmentID) REFERENCES Department(departmentID) ON DELETE CASCADE,
    FOREIGN KEY(qualificationID) REFERENCES Qualification(qualificationID) ON DELETE CASCADE
);

--Group table
CREATE TABLE StudyGroup (
    groupID INTEGER PRIMARY KEY AUTOINCREMENT,
    specialityID INTEGER NOT NULL,
    groupCode TEXT NOT NULL,
    creationYear INTEGER,
    FOREIGN KEY(specialityID) REFERENCES Speciality(specialityID) ON DELETE CASCADE
);

-- Student table
CREATE TABLE Student (
    gradebookID INTEGER PRIMARY KEY,
    surname TEXT NOT NULL,
    name TEXT NOT NULL,
    second_name TEXT NOT NULL,
    groupID INTEGER NOT NULL,
    ZNO REAL NOT NULL,
    tuition_fee BOOLEAN NOT NULL,
    email TEXT,
    FOREIGN KEY(groupID) REFERENCES StudyGroup(groupID) ON DELETE CASCADE
);
--Subject table
CREATE TABLE Subject (
    subjectID INTEGER PRIMARY KEY AUTOINCREMENT,
    subjectName TEXT NOT NULL,
    hours INTEGER NOT NULL,
    subjectCredits REAL NOT NULL,
    controlForm TEXT
);

-- Academical performance table
CREATE TABLE AcademPerformance (
    gradebookID INTEGER NOT NULL,
    subjectID INTEGER NOT NULL,
    score100 INTEGER NOT NULL,
    score5 INTEGER NOT NULL,
    PRIMARY KEY (gradebookID, subjectID),
    FOREIGN KEY(gradebookID) REFERENCES Student(gradebookID) ON DELETE CASCADE,
    FOREIGN KEY(subjectID) REFERENCES Subject(subjectID) ON DELETE CASCADE
);

INSERT INTO Subject(subjectID, subjectName, hours, subjectCredits, controlForm)
VALUES
(1, 'Математичний аналіз', 210, 7, 'екзамен'),
(2, 'Дискретна математика', 180, 6, 'екзамен'),
(3, "Комп'ютерні мережі", 150, 5, 'екзамен'),
(4, 'Операційні системи', 120, 4, 'залік'),
(5, "Об'єктно-орієнтоване програмування", 210, 7, 'екзамен'),
(6, 'Англійська мова', 90, 3, 'залік'),
(7, 'Історія України', 90, 3, 'екзамен'),
(8, 'Фізика', 120, 4, 'екзамен'),
(9, 'Алгоритмізація та програмування', 240, 8, 'екзамен'),
(10, 'Фізична культура', 45, 1.5, 'залік'),
(11, 'Бізнес-планування', 90, 3, 'залік'),
(12, 'Лінійне алгебра', 120, 4, 'екзамен'),
(13, 'Аналітична геометрія', 120, 4, 'екзамен'),
(14, 'Філософія', 90, 3, 'екзамен');


INSERT INTO Faculty (facultyID, denomination, facultyName) VALUES
(1, 'інститут', "комп'ютерних наук та інформаційних технологій"),
(2, 'інститут', "комп'ютерних технологій, автоматики та метрології"),
(3, 'інститут', 'прикладної математики та фундаментальних наук'),
(4, 'інститут', 'гуманітарних та соціальних наук'),
(5, 'факультет', 'теплоенеретики'),
(6, 'факультет', 'фізики та математики'),
(7, 'факультет', 'радіотехнічний'),
(8, 'факультет', 'інформатики та обчислювальної техніки'),
(9, 'інститут', 'архітектури та дизайну'),
(10, 'інститут', 'енергетики та систем керування'),
(11, 'інститут', 'економіки та менеджменту'),
(12, 'інститут', 'права, психології та інноваційної освіти'),
(13, 'інститут', 'хімії та хімічних технологій');

INSERT INTO Department (departmentID, departmentName, facultyID) VALUES
(1, 'інформаційних систем та мереж', 1),
(2, 'вищої математики', 1),
(3, 'іноземних мов', 3),
(4, 'програмного забезпечення', 4),
(5, 'автоматизованих систем управління', 1),
(6, 'систем штучного інтелекту', 1),
(7, 'систем автоматизованого проектування', 1),
(8, 'загальної фізики', 3),
(9, 'захисту інформації', 2),
(10, 'прикладної фізики', 3),
(11, 'програмного забезпечення систем', 8),
(12, 'матаналізу та теорії ймовірностей', 6),
(13, 'технології органічних продуктив', 13),
(14, 'історії та культурної спадщини', 4),
(15, 'теплоенеретики, теплових електростанцій', 10);

INSERT INTO Qualification (qualificationID, levelQualification, levelEducation, specialityCredits) VALUES
(1, 'бакалавр', 'бакалаврський', 240),
(2, 'бакалавр за 3 роки', 'бакалаврський', 180),
(3, 'магістр', 'магістерський', 90),
(4, 'доктор філософії', 'освітньо-науковий', 240);

INSERT INTO Speciality (specialityID, specialityName, departmentID, qualificationID, enrollmentStatus) VALUES
(1, 'Системний аналіз', 1, 1, 'денна'),
(2, 'Прикладна математика', 1, 1, 'денна'),
(3, 'Інженерія програмного забезпечення', 1, 1, 'денна'),
(4, 'Інтелектуальні інформаційні технології', 1, 2, 'денна'),
(5, 'Аналіз даних', 1, 3, 'денна'),
(6, 'Інженерія програмного забезпечення', 1, 4, 'денна'),
(7, 'Кібербезпека', 9, 1, 'заочна'),
(8, "Комп'ютерні науки", 5, 1, 'денна'),
(9, 'Прикладна фізика', 10, 1, 'заочна'),
(10, 'Математика', 12, 2, 'денна'),
(11, 'Статистика', 2, 1, 'заочна'),
(12, "Комп'ютерна інженерія", 2, 1, 'денна'),
(13, 'Хімічні технології', 13, 1, 'денна'),
(14, 'Управління культурною спадщиною', 14, 3, 'денна');

INSERT INTO StudyGroup (groupID, specialityID, groupCode, creationYear) VALUES
(1, 1, 'СА12', 2023),
(2, 1, 'СА22', 2022),
(3, 3, 'ПЗ25', 2022),
(4, 5, 'CAAД11', 2023),
(5, 6, 'ПЗ14', 2021),
(6, 1, 'CA32', 2021),
(7, 7, 'КБ23', 2022),
(8, 8, 'KH305', 2021),
(9, 9, 'ПФ21', 2022),
(10, 12, 'KI26', 2022),
(11, 13, 'XT33', 2021),
(12, 4, 'IT21', 2022),
(13, 14, 'УКС11', 2023),
(14, 10, 'MT11', 2023);

INSERT INTO Student (gradebookID, surname, name, second_name, groupID, ZNO, tuition_fee, email) VALUES
(20221201, 'Войціхович', 'Ярослав', 'Юрійович', 1, 159.909, 'бюджетна', 'voizihovich.yaroslav.sa.2021@gmail.com'),
(20221202, 'Гриній', 'Назарій', 'Романович', 3, 173.673, 'бюджетна', 'gryniy.nazariiy.pz.2020@gmail.com'),
(20221203, 'Драпайло', 'Ярослава', 'Михайлівна', 6, 191.486, 'контрактна', 'drapailo.yaryna.sa.2019@gmail.com'),
(20221204, 'Пачковська', 'Софія', 'Василіна', 2, 160.293, 'контрактна', 'pachkovska.sofia.sa.2020@gmail.com'),
(20221205, 'Комарницький', 'Василь', 'Васильович', 5, 199.757, 'бюджетна', 'komarnyzkiy.vasyl.pz.2021@gmail.com'),
(20221206, 'Дунець', 'Андрій', 'Романович', 2, 183.475, 'бюджетна', 'dunets.andriy.pz.2020@gmail.com'),
(20221207, 'Ломницька', 'Соломія', 'Віталіївна', 8, 158.297, 'контрактна', 'lomnyzka.solomiia.saad.2021@gmail.com'),
(20221208, 'Потопляк', 'Максим', 'Юрійович', 6, 196.584, 'бюджетна', 'potopliak.maksym.sa.2019@gmail.com'),
(20221209, 'Пшеницька', 'Надія', 'Анатоліївна', 5, 170.99, 'бюджетна', 'phenyzka.nadiya.pr.2021@gmail.com'),
(20221210, 'Добровольська', 'Марія', 'Павлівна', 1, 193.983, 'бюджетна', 'dobrovolska.maria.sa.2021@gmail.com'),
(20221211, 'Книш', 'Матвій', 'Олегович', 7, 184.324, 'контрактна', 'khvsh.matviy.kb.2020@gmail.com'),
(20221216, 'Шипак', 'Анна', 'Ігорівна', 10, 145.345, 'бюджетна', 'shypak.anna.ki.2020@gmail.com'),
(20221212, 'Косар', 'Олег', 'Анатолійович',12, 162.333,'контрактна', 'kosar.oleg.it.2020@gmail.com'),
(20221213, 'Крук', 'Дарина', 'Станіславівна',14, 174.786 ,'бюджетна', 'kryk.daryna,.mt.2021@gmail.com'),
(20221214, 'Лозінський', 'Михайло', 'Михайлович',13, 168.745, 'контрактна', 'lozynskiy.mykhailo.uks.2021@gmail.com'),
(20221215, 'Устич', 'Олександр', 'Юрійович',9, 192.567, 'бюджетна', 'ustych.oleksandr.pf.2020@gmail.com');


INSERT INTO AcademPerformance (gradebookID, subjectID, score100, score5) VALUES
(20221201, 2, 71, 4),
(20221201, 8, 82, 4),
(20221203, 1, 54, 3),
(20221203, 2, 68, 3),
(20221204, 3, 78, 4),
(20221204, 4, 86, 4),
(20221204, 5, 59, 3),
(20221205, 6, 98, 5),
(20221205, 9, 82, 4),
(20221206, 3, 75, 4),
(20221206, 4, 79, 4),
(20221207, 11, 48, 2),
(20221209, 7, 100, 5),
(20221210, 2, 92, 5),
(20221212, 9, 73, 4),
(20221213, 13, 80, 4),
(20221213, 12, 85, 4),
(20221215, 8, 95, 5),
(20221216, 4, 92, 5);





