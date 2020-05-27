require './config/environment'
require 'sinatra/flash'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_wishlist_app"
    register Sinatra::Flash
  end

  get "/" do
    if !logged_in?
      erb :index
    else
      redirect "users/#{current_user.id}"
    end
  end

  helpers do 
    def logged_in?
      #true if user is logged in, otherwise false
      !!current_user
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def authorized?(wishlist)
      wishlist.user == current_user
    end

  end

end
