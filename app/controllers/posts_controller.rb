class PostsController < ApplicationController
    #CRUD

    #READ
    get '/posts' do
      redirect_if_not_logged_in
      if params[:query] #search bar
        @posts = Post.search(params[:query])
      elsif params[:filter] #filter by author drop down 
        @posts = Post.by_author(params[:filter])
      else # search/filter is not filled out so show all games
        @posts = Post.all
      end
      erb :'posts/index'
    end

    get '/posts/new' do
        redirect_if_not_logged_in
        erb :'/posts/new'
    end

      #CREATE
    post '/posts' do
        @post = Post.new(params[:post])
        if @post.save
          redirect "/posts/#{@post.id}"
        else
          redirect '/posts/new'
        end
    end

    get '/posts/:id' do
        # id is coming from url - params
        @posts = Post.all
        find_post
        erb :'posts/show'
    end

    get '/posts/:id/edit' do
        redirect_if_not_logged_in
        find_post
        if authorized_to_edit?(@post)
          erb :'/posts/edit'
        else
          redirect "/posts/#{@post.id}"
        end
    end

      #UPDATE
    patch '/posts/:id' do
        find_post
        if params[:post][:title] == "" || params[:post][:author] == "" || params[:post] == nil
          redirect "/posts/#{@post.id}/edit"
        else
          @post.update(params[:post])
          redirect "/posts/#{@post.id}"
        end
    end

    #DELETE
    delete '/posts/:id' do
        find_post
        if authorized_to_edit?(@post)
          @post.destroy
          redirect '/posts'
        else
          redirect "/posts/#{@post.id}"
        end
    end


  


    private

    def find_post
      @post = Post.find_by_id(params[:id])
    end



end