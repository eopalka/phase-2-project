class UsersController < ApplicationController

    #render login form
    get "/login" do
        erb :login
    end

    #recieve the data (params) from the login form
    post "/login" do 
    #find the user
    user = User.find_by(email: params[:email])
        #authenticate the user
        if user && user.authenticate(params[:password])
            #creating a key/value pair in the session hash using the users id to actually log them in
            session[:user_id] = user.id
            #redirect to user's profile
            redirect "/users/#{user.id}"
        else
            #show error message
            redirect '/login'
        end
    end

    #user SHOW route
    get "/users/:id" do
        "users show page!"
    end
end