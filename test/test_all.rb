# These unit tests owe a great deal to this:
# http://blog.jayfields.com/2007/10/rails-unit-test-without-rails.html

require 'rubygems'
require 'sqlite3'
require 'test/unit'
require 'activesupport'
require 'activerecord'
require '../lib/connections'

include Requires
include Tables
include Connections

class TestFXCess < Test::Unit::TestCase

	def test_equality
		assert_equal true, true
	end

	def test_connection_to_db
		connect_to_db('sqlite3', '../db/blah.db')
	end
	
	def test_get_first_book_title
		connect_to_db('sqlite3','../db/blah.db')
		title = Book.find(:first).title
		assert_equal 'house of leaves', title
	end
	
	def test_get_first_book_author
		connect_to_db('sqlite3','../db/blah.db')
		author = Book.find(:first).author_lastname
		assert_equal 'danielewski', author
	end
	
	def test_insert_book_into_db
		connect_to_db('sqlite3', '../db/blah.db')
		holmes = Book.new
		holmes.author_lastname = 'doyle'
		holmes.author_firstname = 'arthur'
		holmes.title = 'hound of the baskervilles'
		holmes.genre = 'classic'
		holmes.notes = 'i read this when i was a child and loved it'
		holmes.save
		
		check = Book.find(:last)
		assert_equal 'hound of the baskervilles', check.title
		assert_equal 'doyle', check.author_lastname
		assert_equal 'arthur', check.author_firstname
		assert_equal 'classic', check.genre
		
		check.destroy
	end
	
end
