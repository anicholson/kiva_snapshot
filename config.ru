require 'bundler'

require 'rack'
require 'sinatra'
require 'sinatra/reloader'


require_relative 'kiva_snapshot_app'

use Rack::Session::Cookie, secret: ENV['COOKIE_SECRET']

run KivaSnapshotApp
