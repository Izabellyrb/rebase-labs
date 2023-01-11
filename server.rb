require 'sinatra'
require 'rack/handler/puma'
require 'csv'
require_relative 'import_from_csv'


get '/api/tests' do
  rows = CSV.read("./data.csv", col_sep: ';')

  columns = rows.shift

  rows.map do |row|
    row.each_with_object({}).with_index do |(cell, acc), idx|
      column = columns[idx]
      acc[column] = cell
    end
  end.to_json
end

post '/import' do
  #csv = request.body.read

  MyJob.perfom_async

  'Ok'
end

get '/api/mdata' do
  ImportFromCsv.new.all
end

get '/' do
  File.read('./public/index.html')
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)