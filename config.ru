require_relative 'boot'
require_relative 'kiva_snapshot_app'

use Rack::Session::Cookie, secret: ENV['COOKIE_SECRET']

run KivaSnapshotApp
