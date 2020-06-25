class WishlistsController < ApplicationController

    #create a form to create wishlists
    get '/wishlists/new' do
        if !logged_in?
            redirect '/'
        else
            erb :"wishlists/new"
        end
    end

    #post request to create the wishlist
    post "/wishlists" do
        if !logged_in?
            redirect '/'
        end
        if params[:title] != ""
            @wishlist = Wishlist.create(title: params[:title], user_id: current_user.id)
            redirect :"/wishlists/#{@wishlist.id}"
        else
            redirect :"/wishlists/new"
        end
    end

    #show page for wishlists
    get '/wishlists/:id' do 
        set_wishlist
        if logged_in?
            if authorized?(@wishlist)
                erb :"wishlists/show"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect "/"
        end
    end

    #edit wishlists
    get '/wishlists/:id/edit' do
        set_wishlist
        if logged_in?
            if authorized?(@wishlist)
                erb :'/wishlists/edit'
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end 
    end

    #patch route
    patch '/wishlists/:id' do 
        #find the wishlist to modify
        set_wishlist
        #update the wishlist title
        if logged_in?
            if authorized?(@wishlist)
                @wishlist.update(title: params[:title])
                redirect "/wishlists/#{@wishlist.id}"
            else
                redirect "users/#{current_user.id}"
            end
        else
            redirect '/'
        end
    end

    #delete wishlist
    delete '/wishlists/:id' do
        set_wishlist
        if authorized?(@wishlist)
            @wishlist.destroy
            redirect '/wishlists' 
        else
            redirect '/wishlists'
        end
    end

    #index page for all wishlists
    get '/wishlists' do
        @wishlist = current_user.wishlists
        #@wishlist = Wishlist.where(user_id: current_user.id)
        erb :'wishlists/wishlists'
    end

    #wishlist methods
    def set_wishlist 
        @wishlist = Wishlist.find(params[:id])
    end

end