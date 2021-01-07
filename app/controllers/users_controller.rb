class UsersController < ApplicationController

    #render login form
    get "/login" do
        erb :"/users/login"
    end

    #recieve the data (params) from the login form
    post "/login" do 
    @user = User.find_by(email: params[:email])
        if @user && @user.authenticate(params[:password])
            #creating a key/value pair in the session hash using the users id to actually log them in
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        else
            redirect '/login'
        end
    end

    get "/users/:id" do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end

    get '/signup' do
        erb :"/users/signup"
    end

    post '/users' do
        @user = User.new(params)
        if @user.save
          session[:user_id] = @user.id
          redirect "/users/#{@user.id}"
        else
          redirect '/signup'
        end
      end
        
    get '/logout' do
        session.clear
        redirect '/'
    end


end
