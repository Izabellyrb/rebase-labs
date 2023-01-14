require 'sinatra'
require 'pg'
require 'rack/handler/puma'
require './data.rb'


get '/api/tests' do
  content_type :json
  rows = CSV.read("./data.csv", col_sep: ';')

  columns = rows.shift

  rows.map do |row|
    row.each_with_object({}).with_index do |(cell, acc), idx|
      column = columns[idx]
      acc[column] = cell
    end
  end.to_json
end

get '/' do
  File.read('./public/index.html')
end

get '/api/mdata' do
  content_type :json
  import = Data.new.all.to_json
end

post '/import' do
  Data.new.insert_data
  'Arquivo importado!'
end

post '/import_async' do
  MyJob.perform_async

end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)