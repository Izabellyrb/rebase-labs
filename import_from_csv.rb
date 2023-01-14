require 'pg'
require './data.rb'

Data.new.insert_data('./data.csv')
