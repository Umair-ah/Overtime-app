class PostsController < ApplicationController
    before_action :set_posts, only: [:show]

    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id

        if @post.save
            redirect_to @post, notice:"Your Post Is Successfully Created!"
        else
            render :new
        end
    end

    def show
        
    end
    

    private
        def set_posts
            @post = Post.find(params[:id])       
        end
        
    
        def post_params
            params.require(:post).permit(:date, :rationale)
        end
    
end