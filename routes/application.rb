module Routing
  module Application
    def self.registered(app)
      app.get '/login' do
        slim :login
      end

      app.post '/login' do
        if params['password'] == settings.login_password
          session[:logged_in] = true
          redirect to('/', 200)
        else
          slim :login
        end
      end

      app.get '/' do
        redirect to('/login', 307) unless logged_in?
        slim :application
      end
    end
  end
end
