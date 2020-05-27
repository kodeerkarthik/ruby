class PostsController < ApplicationController
    load_and_authorize_resource
    before_action :set_post, only: [:show, :edit, :update]
    before_filter :authenticate_user!, excpet: [:index, :show]
    skip_before_action :verify_authenticity_token

  def index
    @post = Post.where(:User_id => current_user.id).notpublished  
    @posts = Post.published
  end
 
  def show
    @post = Post.find(params[:id])
  end
 
  def new
    @post = Post.new
  end
 
  def create
    @post = Post.new(post_params)
    @post.User_id = current_user.id  
    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
 
  def edit
    @post = Post.find(params[:id])
  end
 
  def update
    if @post.update_attributes(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end
 
  private
 
  def post_params
    params.require(:post).permit(:title, :body, :image, :published)
  end
 
  def set_post
    @post = Post.find(params[:id])
  end
end
