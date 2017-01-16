require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'active_support/inflector'
require_relative './models/models'
require_relative './helpers/helpers'

set :database_file, '../db/database.yml'

get /^\/(events|births|deaths)$/ do
  set_day_month
  json @day_month.to_json_with(params['captures'].first)
end
