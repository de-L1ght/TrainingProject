CREATE TABLE IF NOT EXISTS Organization
(
    id        INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version   INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    name      VARCHAR(50)  NOT NULL COMMENT 'Название',
    full_name VARCHAR(100) NOT NULL COMMENT 'Полное название',
    inn       VARCHAR(10)  NOT NULL COMMENT 'ИНН',
    kpp       VARCHAR(9)   NOT NULL COMMENT 'КПП',
    address   VARCHAR(120) NOT NULL COMMENT 'Адрес',
    phone     VARCHAR(11) COMMENT 'Номер телефона',
    is_active BOOLEAN      NOT NULL DEFAULT TRUE COMMENT 'Статус активности'
);
COMMENT ON TABLE Organization IS 'Организация';

CREATE TABLE IF NOT EXISTS Office
(
    id              INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version         INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    organization_id INTEGER      NOT NULL COMMENT 'Уникальный идентификатор организации',
    name            VARCHAR(50)  NOT NULL COMMENT 'Название',
    address         VARCHAR(120) NOT NULL COMMENT 'Адрес',
    phone           VARCHAR(11) COMMENT 'Номер телефона',
    is_active       BOOLEAN      NOT NULL DEFAULT TRUE COMMENT 'Статус активности'
);
COMMENT ON TABLE Office IS 'Офис';

CREATE TABLE IF NOT EXISTS User
(
    id            INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version       INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    office_id     INTEGER     NOT NULL COMMENT 'Уникальный идентификатор офиса',
    first_name    VARCHAR(15) NOT NULL COMMENT 'Имя',
    second_name   VARCHAR(20) COMMENT 'Отчество',
    last_name     VARCHAR(25) COMMENT 'Фамилия',
    position      VARCHAR(40) NOT NULL COMMENT 'Должность',
    phone         VARCHAR(11) COMMENT 'Номер телефона',
    country_id    INTEGER     NOT NULL COMMENT 'Уникальный идентификатор страны',
    is_identified BOOLEAN     NOT NULL DEFAULT TRUE COMMENT 'Статус идентификации'
);
COMMENT ON TABLE User IS 'Пользователь';

CREATE TABLE IF NOT EXISTS Document_Type
(
    id      INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version INTEGER      NOT NULL COMMENT 'Служебное поле hibernate',
    code    CHAR(2)      NOT NULL COMMENT 'Код документа',
    name    VARCHAR(113) NOT NULL COMMENT 'Наименование'
);
COMMENT ON TABLE Document_Type IS 'Тип документа, удостоверяющего личность';

CREATE TABLE IF NOT EXISTS Country
(
    id      INTEGER COMMENT 'Уникальный идентификатор' PRIMARY KEY AUTO_INCREMENT,
    version INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    code    CHAR(3)     NOT NULL COMMENT 'Код страны',
    name    VARCHAR(40) NOT NULL COMMENT 'Название'
);
COMMENT ON TABLE Country IS 'Гражданство';

CREATE TABLE IF NOT EXISTS Document
(
    user_id INTEGER COMMENT 'Уникальный идентификатор пользователя' PRIMARY KEY,
    version INTEGER     NOT NULL COMMENT 'Служебное поле hibernate',
    type_id INTEGER     NOT NULL COMMENT 'Уникальный идентификатор типа документа',
    number  VARCHAR(20) NOT NULL COMMENT 'Номер документа',
    date    DATE        NOT NULL COMMENT 'Дата'
);
COMMENT ON TABLE Document IS 'Документ, удостоверяющий личность';

CREATE INDEX IX_Office_Organization_Id ON Office (organization_id);
ALTER TABLE Office
    ADD FOREIGN KEY (organization_id) REFERENCES Organization (id);

CREATE INDEX IX_User_Office_Id ON User (office_id);
ALTER TABLE User
    ADD FOREIGN KEY (office_id) REFERENCES Office (id);

CREATE INDEX IX_User_Country_Id ON User (country_id);
ALTER TABLE User
    ADD FOREIGN KEY (country_id) REFERENCES Country (id);

CREATE INDEX IX_Document_Type_Id ON Document (type_id);
ALTER TABLE Document
    ADD FOREIGN KEY (type_id) REFERENCES Document_Type (id);

CREATE INDEX IX_Document_User_Id ON Document (user_id);
ALTER TABLE Document
    ADD FOREIGN KEY (user_id) REFERENCES User (id);