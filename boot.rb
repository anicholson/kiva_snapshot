require 'bundler'

require 'sinatra'
require 'sinatra/asset_pipeline/task'
require 'sinatra/activerecord/rake'
require 'activerecord-jdbc-adapter'
require 'jdbc-postgresql'


%w(clients models workers).each do |app_directory|
  path = Pathname.new(__FILE__).join('..', app_directory, '**', '*.rb')

  Dir.glob(path).each do |application_file|
    require application_file
  end
end

require 'kiva_snapshot_app'
