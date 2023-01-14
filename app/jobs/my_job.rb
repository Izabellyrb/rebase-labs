require 'sidekiq'
require './data.rb'

class MyJob
  include Sidekiq::Job

  def perform(json_data)
    Data.new.import_from_csv(json_data)
    puts 'Arquivo importado com sucesso!'
  end
end