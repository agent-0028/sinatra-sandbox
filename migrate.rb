require 'sequel'

DB = Sequel.connect('sqlite://podcast.db')

DB.create_table :episodes do
  primary_key :id
  String :title
  DateTime :datetime
end

dataset = DB[:episodes]
dataset.insert(id: 1, title: 'a title', datetime: '1966-05-18')
