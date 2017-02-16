class PostsController < ApplicationController
  before_filter :authenticate_user!, except: [:index]

  def index
    @posts = Post.all
    @post = Post.new
    @user = current_user.id
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(asset: post_params[:asset], name: post_params[:name], content: post_params[:content], owner_id: current_user.id)
    if @post.save
      redirect_to "/"
      flash[:notice] = "Post successful!"
    else
      redirect_to new_user_post_path(current_user)
      flash[:alert] = "Upload failed"
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(asset: post_params[:asset], name: post_params[:name], content: post_params[:content], owner_id: current_user.id)
      flash[:notice] = "Changes saved"
      redirect_to "/"
    else
      flash[:alert] = "Changes were not saved"
      render :edit
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to "/"
  end

private
  def post_params
    params.require(:post).permit(:asset, :name, :content)
  end
end
