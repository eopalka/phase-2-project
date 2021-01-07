class PostsController < ApplicationController

    #CRUD
    get '/posts' do
        @posts = Post.all
        erb :'posts/index'
    end

    get '/posts/new' do
        redirect_if_not_logged_in
        erb :'/posts/new'
    end


    post "/posts" do
        @post = Post.new(title: params[:title], image_url: params[:image_url], description: params[:description], user_id: current_user.id)
        if @post.save
          redirect "/posts/#{@post.id}"
        else
          redirect '/posts/new'
        end
    end

    get '/posts/:id' do
        # id is coming from url - params
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

    patch '/posts/:id' do
        find_post
        @post.update(title: params[:title], image_url: params[:image_url], description: params[:description])
        redirect "/posts/#{@post.id}"
    end

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
      @post = Post.find(params[:id])
    end


end