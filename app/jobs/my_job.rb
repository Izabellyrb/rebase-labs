require 'sidekiq'

class MyJob
  include Sidekiq::Job

  def perform(csv)
    MyQuery.new.import_from_csv(csv)
    puts 'Exames foram importados.'
  end
end