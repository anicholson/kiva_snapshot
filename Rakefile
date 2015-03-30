require 'sinatra/asset_pipeline/task'
require 'sinatra/activerecord/rake'
require './kiva_snapshot_app'
require 'activerecord-jdbc-adapter'
require 'jdbc-postgresql'

namespace :db do
  task :load_config do
    require './kiva_snapshot_app'
  end
end

Sinatra::AssetPipeline::Task.define! KivaSnapshotApp

