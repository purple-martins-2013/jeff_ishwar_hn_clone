class PostsController < ApplicationController
  def index
    @posts = Post.all
    @error = session[:error]
    session[:error] = nil
  end

  def create
    Post.create(post_params)
    redirect_to action: :index
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def post_params
    params.require(:post).permit(:title, :description)
  end

end  
