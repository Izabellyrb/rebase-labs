require 'sidekiq'

class MyJob
  include Sidekiq::Job

  def perform
    puts 'My job is done'
    #ImportToDatabase.import(csv)
  end
end

#perform = logica do job (import)