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
        #   flash[:message] = "Post successfully created!"
          redirect "/posts/#{@post.id}"
        else
        #   flash[:errors] = "Post creation failure: #{@post.errors.full_messages.to_sentence}"
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
        #   flash[:errors] = "Not authorized to edit that post."
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
        #   flash[:message] = "Successfully deleted post!"
          redirect '/posts'
        else
        #   flash[:errors] = "You're not authorized to delete this post."
          redirect "/posts/#{@post.id}"
        end
    end

    private

    def find_post
      @post = Post.find(params[:id])
    end


end