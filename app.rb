require 'sinatra'
require 'sinatra/activerecord'
require './environments'
require 'JSON'

Dir[File.join(File.dirname(__FILE__), 'app', '**', '*.rb')].each do |file|
  require file
end

before do
  content_type :json

  unless (1..31).cover?(params[:day].to_i) && (1..12).cover?(params[:month].to_i)
    halt 400, { error: 'Not a valid request.' }.to_json
  end
end

get '/episodes' do
  query = { day: params[:day], month: params[:month] }
  query[:episode_type] = params[:type] if params[:type]

  Episode.where(query).to_json
end
