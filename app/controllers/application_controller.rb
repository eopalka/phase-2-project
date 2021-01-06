require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    #enable the sessions hash
    enable :sessions
    #set a session secret for extra layer of security
    set :session_secret, "session_secret"
  end
  
  get "/" do
   erb :welcome
  end


  get "/" do
    if logged_in?
      redirect "/users/#{current_user.id}"
    else
      erb :welcome
    end
  end

  helpers do
  #   # returns boolean if user is logged in or not - double bang converts value
  #   def logged_in?
  #       !!current_user
  #   end
    #keeps track of the logged in user
    def current_user
      User.find_by(id: session[:user_id])
    end
  #   # #authorization helper for editing & deleting posts
  #   # def authorized_to_edit?(post)
  #   #   post.user == current_user
  #   # end
  # #   def redirect_if_not_logged_in
  # #     if !logged_in?
  # #       flash[:error] = "You must be logged in to view this page"
  # #       redirect '/login'
  # #     end
  # # end
  end

end
