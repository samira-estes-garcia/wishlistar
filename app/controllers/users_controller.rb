class UsersController < ApplicationController

    #render the login page
    get '/login' do 
        erb :login
    end

    #receive login form, find the user, and log the user in (create session)
    post '/login' do 
        #find the user
        @user = User.find_by(email: params[:email])
        #authenticate the user
        if @user.authenticate(params[:password])
            #log the user in - create the user session
            session[:user_id] = @user.id
            #redirect the user
            redirect :"users/#{@user.id}"
        else
            #tell user they entered invalid credentials
            #redirect them to the login page
        end
    end

    get '/signup' do 
    end

    post '/signup' do 
    end

    #user show route
    get '/users/:id' do 
        #this will be the users show page
    end

end