require '../lib/connections'
include Requires
include Tables
include Connections


connect_to_db('sqlite3','../db/blah.db')

x = [Book.find(:first).author, Book.find(:first).title]

puts x
