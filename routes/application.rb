module Routing
  module Application
    def self.registered(app)
      app.get '/login' do
        slim :login
      end

      app.get '/' do
        redirect to('/login', 307) unless logged_in?
        slim :application
      end
    end
  end
end
