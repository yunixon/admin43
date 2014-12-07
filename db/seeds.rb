# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Вечеринка Ростелеком', 'Встреча рубистов', 'Встреча сисадминов', 'Учеба 1С', 'Учеба виртуализации', 'Учеба HyperV',
 'Microsoft Windows сертификация', 'Соревнование сисадминов', 'Выиграй книгу'].each do |title|
  Event.find_or_create_by(title: title, organizer_id: 4)
end

['Ростелеком работа', 'Работа', 'Работа для сисадминов', '1с работа', 'Подработка эникею', 'Настройка виртуализации',
 'Помощь в получении сертификата', 'Удаленная настройка сервера', 'Написание скрипта'].each do |name|
  Job.find_or_create_by(name: name, employer_id: 3)
end

['Главная новость', 'Новый стиль', 'Киров развивается', 'Киров ищет сисадминов', 'Новость 1', 'Новость 2',
 'Новость 3', 'Новость 4', 'Новость 5'].each do |name|
  Newsline.find_or_create_by(name: name, body: 'Текст новости')
end
