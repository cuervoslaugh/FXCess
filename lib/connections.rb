module Requires
	require 'rubygems'
	require 'activerecord'
end

module Tables
	class Book < ActiveRecord::Base
	end
end

module Connections
	def connect_to_db(adapter_name, filename)
		ActiveRecord::Base.establish_connection(
			{:adapter => adapter_name,
			 :database => filename}
		)
	end
	
	def me_me
		puts "blah blah me"
	end
end