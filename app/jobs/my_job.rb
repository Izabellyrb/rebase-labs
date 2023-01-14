require 'sidekiq'
require './data.rb'

class MyJob
  include Sidekiq::Job

  def perform
    Data.new.import_from_csv
    puts 'Arquivo importado com sucesso!'
  end
end