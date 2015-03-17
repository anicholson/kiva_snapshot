require 'sinatra/asset_pipeline'
require 'slim'

require 'oauth2'



class KivaSnapshotApp < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  set :root, File.dirname(__FILE__)

  set :assets_precompile, %w(*.js *.css *.png *.jpg *.svg *.eot *.ttf *.woff *.woff2)

  configure do
    mime_type :woff2, 'application/font-woff2'
  end

  register Sinatra::AssetPipeline


  get '/' do
    slim :application
  end
end
