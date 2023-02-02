#include functions we wrote
require_relative '../lib/sql_queries.rb'
#includes sqlite3 gem
require_relative '../config/environment'
require 'pry'

#create new file to read from that's not in memory
db = SQLite3::Database.new('db/bears.sql')
db.execute('DROP TABLE bears;')
#reads sql command to create bear table
create_sql = File.read("lib/create.sql")
db.execute_batch(create_sql)
#populates database with seed data 
insert_sql = File.read("lib/seed.sql")
db.execute_batch(insert_sql)


binding.pry
