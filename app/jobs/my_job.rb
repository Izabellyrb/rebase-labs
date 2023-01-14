require 'sidekiq'
require './data.rb'

class MyJob
  include Sidekiq::Job

  def perform
    Data.new.import_from_csv
  end
end