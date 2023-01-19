require 'sinatra'
require 'pg'
require 'rack/handler/puma'
require './data.rb'


get '/' do
  erb :index
end

get '/api/mdata' do
  content_type :json
  Data.new.all.to_json
end

get '/api/mdata/:token' do
  content_type :json
  Data.new.find(params[:token]).to_json
end

post '/import' do
  Data.new.insert_data(params[:file])
  'Arquivo importado!'
end

post '/import_async' do
  MyJob.perform_async
end

get '/token_search' do
  @token = params[:token]
  @exams_search = Data.new.find(@token)
  erb :token_search
end

Rack::Handler::Puma.run(
  Sinatra::Application,
  Port: 3000,
  Host: '0.0.0.0'
)