require 'sinatra'
require 'sinatra/json'
require 'sinatra/activerecord'
require 'active_support/inflector'
require 'sinatra-active-model-serializers'
require_relative './models/models'
require_relative './serializers/serializers'
require_relative './helpers/helpers'

set :database_file, '../db/database.yml'
set :serializers_path, './serializers'
set :public_folder, "#{__dir__}/../../client/build"
set :protection, except: [:json_csrf]

get %r{^\/(events|births|deaths)$} do
  set_day_month
  json @day_month, scope: { episode_type: params['captures'].first.singularize }
end

get '/*' do
  send_file "#{settings.public_folder}/index.html"
end
