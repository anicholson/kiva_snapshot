module Routing
  module Application
    def self.registered(app)
      app.get '/login' do
        slim :login
      end

      app.get '/' do
        slim :application
      end
    end
  end
end
