# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Вечеринка Ростелеком', 'Встреча рубистов', 'Встреча сисадминов', 'Учеба 1С', 'Учеба виртуализации', 'Учеба HyperV',
  'Microsoft Windows сертификация', 'Соревнование сисадминов', 'Выиграй книгу'].each do |title|
  Event.find_or_create_by({title: title})
end

['Ростелеком работа', 'Работа', 'Работа для сисадминов', '1с работа', 'Подработка эникею', 'Настройка виртуализации',
  'Помощь в получении сертификата', 'Удаленная настройка сервера', 'Написание скрипта'].each do |name|
  Job.find_or_create_by({name: name})
end