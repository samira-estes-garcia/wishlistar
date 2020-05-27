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
            flash.next[:error] = "Incorrect Email or Password. Please Try Again."
            #redirect them to the login page
            redirect '/login'
        end
    end

    #render the signup form
    get '/signup' do 
        erb :signup
    end

    post '/users' do 
        @user = User.new(params)
        #require unique email for all users
        if User.all.any?{|user|user.email.downcase == params["email"].downcase}
            flash.next[:error] = "This email is already associated with an account."
            redirect '/signup'
        else
        #create new user and persist the new user to the db only if they meet the criteria
            if @user.save
                #log the user in
                session[:user_id] = @user.id
                #redirect to user show page
                redirect :"/users/#{@user.id}"
            else
                #not a valid input, include message to user telling them what is wrong
                flash.next[:error] = "Username, email, and password are required to create an account."
                redirect '/signup'
            end
        end
    end

    #user show route
    get '/users/:id' do 
        @user = User.find_by(id: params[:id])
        if @user == current_user
            erb :'/users/show'
        else
            redirect :"/"
        end
    end

    get '/logout' do 
        session.clear
        redirect '/'
    end

end