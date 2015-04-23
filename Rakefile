require 'sinatra/asset_pipeline/task'
require 'sinatra/activerecord/rake'
require './kiva_snapshot_app'

task :boot do
  require './boot'
end

task :app => :boot do
  require './kiva_snapshot_app'
end

namespace :db do
  task :load_config => :app
end

Sinatra::AssetPipeline::Task.define! KivaSnapshotApp


namespace :scrape do
  desc 'Fetch and store the current User Balance'
  task :user_balance => :app do
    puts "Fetching Kiva User balance for #{Date.today}"

    FetchesKivaBalance.new(KivaClient.new, StorageClient.new).fetch
  end

  desc 'Fetch and store DailyStats from Kiva'

  task :daily_stats => :app do
    puts "Fetching Kiva Stats for #{Date.today}"

    FetchesDailyStats.new(KivaClient.new, StorageClient.new).fetch
  end

  task :loans => :app do
    FetchesLoans.new(KivaClient.new, StorageClient.new).fetch
  end

  desc 'Fetch all items from the Kiva API'
  task :all => [:user_balance, :daily_stats, :loans]
end

