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

  set :root,              File.dirname(__FILE__)
  set :database_file,     'config/database.yml'
  set :sprockets,         Sprockets::Environment.new(root)
  set :assets_precompile, %w(application.js application.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)

  configure do
    mime_type :woff2, 'application/font-woff2'
  end

  register Sinatra::AssetPipeline

  namespace '/api' do
    get '/user_balance.json' do
      balance = LoanBalance.latest

      json({
             updatedAt: balance.balance_at,
             amount: (balance.amount / 100.0).to_f
           })
    end

    get '/stats.json' do
      stats = DailyStats.latest
      json({
             loanCount: stats.loan_count,
             activeLoans: stats.active_loan_count,
             amountLoaned: stats.amount_loaned,
             amountRepaid: stats.amount_repaid,
             updatedAt: stats.created_at
           })
    end

    get '/available_vs_loaned.json' do
      available = LoanBalance.last(90).map do |balance|
        {
          x: balance.balance_at.to_datetime.to_i * 1000,
          y: balance.amount.to_f
        }
      end

      loaned = DailyStats.last(90).map do |stats|
        {
          x: stats.created_at.to_i * 1000,
          y: stats.amount_loaned.to_f
        }
      end
      json({
             available: available,
             loaned: loaned
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
