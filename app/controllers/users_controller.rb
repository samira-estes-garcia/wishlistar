class UsersController < ApplicationController

    #render the login page
    get '/login' do 
        erb :login
    end

    get '/signup' do 
    end

end