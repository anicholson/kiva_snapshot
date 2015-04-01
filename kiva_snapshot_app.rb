require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/namespace'
require 'sinatra/json'
require 'sinatra/asset_pipeline'
require 'sinatra/activerecord'
require 'activerecord-jdbc-adapter'
require 'slim'
require 'jdbc-postgresql'

require 'oauth2'


class KivaSnapshotApp < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Namespace

  configure :development do
    require 'dotenv'
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

  namespace '/api' do
    get '/user_balance.json' do
      balance = LoanBalance.order('balance_at DESC').first || OpenStruct.new(balance_at: 'N/A', amount: 0.0)

      json({
             updatedAt: balance.balance_at,
             amount: balance.amount.to_f
           })
    end
  end


  get '/login' do
    slim :login
  end

  get '/' do
    slim :application
  end
end
