INSERT INTO Document_Type (id, version, code, name) VALUES
(1, 0, '03', 'Свидетельство о рождении')
(2, 0, '07', 'Военный билет')
(3, 0, '10', 'Паспорт иностранного гражданина')
(4, 0, '21', 'Паспорт гражданина Российской Федерации');

INSERT INTO Country (id, version, code, name) VALUES
(1, 0, '643', 'Российская Федерация')
(2, 0, '804', 'Украина')
(3, 0, '112', 'Республика Беларусь')
(4, 0, '840', 'Соединенные Штаты Америки');

INSERT INTO Organization (id, version, name, full_name, inn, kpp, address, phone, is_active) VALUES
(1, 0, 'ООО "Феникс"', 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ФЕНИКС"', '7713793524', '771301001',
'127287, город Москва, Хуторская 2-я улица, дом 38а строение 26', '84952223344', true)
(2, 0, 'ООО "КЭФ"', 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "КРЕДИТЭКСПРЕСС ФИНАНС"', '7707790885', '770701001',
'127055, город Москва, улица Бутырский Вал, дом 68/70 строение 1', '84951112211', true)
(3, 0, 'ООО "Хартия"', 'ОБЩЕСТВО С ОГРАНИЧЕННОЙ ОТВЕТСТВЕННОСТЬЮ "ХАРТИЯ"', '7703770101', '771501001',
'127410, город Москва, Алтуфьевское шоссе, дом 51', '84950001122', true);

INSERT INTO Office (id, version, organization_id, name, address, phone, is_active) VALUES
(1, 0, 1, 'Главный офис на Хуторской', '127287, город Москва, Хуторская 2-я улица, дом 38а строение 26',
'84952223344', true)
(2, 0, 2, 'Главный офис на Бутырском', '127055, город Москва, улица Бутырский Вал, дом 68/70 строение 1',
'84951112211', true)
(3, 0, 2, 'Дополнительный офис на Ленинградском', '125167, город Москва, Ленинградский проспект 47/2',
'84951112222', true)
(4, 0, 3, 'Главный офис на Алтуфьевском', '127410, город Москва, Алтуфьевское шоссе, дом 51',
'84950001122', true);

INSERT INTO User (id, version, office_id, first_name, second_name, last_name, position, phone, country_id,
is_identified) VALUES
(1, 0, 1, 'Иван', 'Иванович', 'Иванов', 'Охранник', '89631234455', 1, true)
(2, 0, 2, 'Петр', 'Петрович', 'Петров', 'Уборщик', '89631114455', 2, true)
(3, 0, 2, 'Николай', 'Николаевич', 'Николаев', 'Менеджер', '89631111111', 1, true)
(4, 0, 3, 'Дмитрий', 'Иванович', 'Петров', 'Охранник', '89632222222', 3, true)
(5, 0, 4, 'Иван', 'Александрович', 'Васькин', 'Бухгалтер', '89633333333', 1, true)
(6, 0, 4, 'Александр', 'Георгьевич', 'Солянов', 'Курьер', '89634444444', 3, true);

INSERT INTO Document (user_id, version, type_id, number, date) VALUES
(1, 0, 4, '1234 123456', '2002-02-02')
(2, 0, 3, '1230 123333', '2003-03-03')
(3, 0, 1, '1200 122222', '2004-04-04')
(4, 0, 3, '1100 111111', '2005-05-05')
(5, 0, 2, '1111 123123', '2006-06-06')
(6, 0, 3, '2222 222222', '2007-07-07');