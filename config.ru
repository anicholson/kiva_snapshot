require 'bundler'

require 'sinatra'
require 'sinatra/reloader'

require 'sass'

require_relative 'kiva_snapshot_app'

use Rack::Session::Cookie, secret: ENV['COOKIE_SECRET']

run KivaSnapshotApp
