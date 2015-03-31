require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/asset_pipeline'
require 'sinatra/activerecord'
require 'activerecord-jdbc-adapter'
require 'slim'
require 'dotenv'
require 'jdbc-postgresql'

require 'oauth2'


class KivaSnapshotApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension

  configure :development do
    register Sinatra::Reloader

    Dotenv.load
  end

  set :root, File.dirname(__FILE__)
  set :database_file, 'config/database.yml'
  set :assets_precompile, %w(*.js application.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)

  configure do
    mime_type :woff2, 'application/font-woff2'
  end

  register Sinatra::AssetPipeline

  get '/login' do
    slim :login
  end

  get '/' do
    slim :application
  end
end
