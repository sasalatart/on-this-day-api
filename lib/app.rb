require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require_relative './models/models'
require_relative './helpers/helpers'

set :database_file, '../db/database.yml'

get '/episodes' do
  valid_date_filter(params[:day], params[:month])

  query = { day: params[:day], month: params[:month] }
  query[:episode_type] = params[:type] if params[:type]
  json episodes: Episode.where(query)
end
