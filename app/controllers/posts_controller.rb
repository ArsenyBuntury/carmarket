class PostsController < ApplicationController
  before_action :current_user
  before_action :current_user, except: %i[index show]
  before_action :load_post, only: %w[show edit update destroy]

  def index
    @posts = Post.order(created_at: :desc)
    if params[:search]
      @posts = Post.where("title LIKE ?", "%#{params[:search]}%")
    else
      @posts = Post.all
    end
  end

  def new
    @post = Post.new
  end

  def show
  end

  def create
    @post = current_user.posts.build(post_params)
    @post.image.attach(params[:post][:image])
    if @post.save
      redirect_to @post
      flash[:success] = "Success!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @post.image.attach(params[:post][:image])
    if @post.update(post_params)
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post.destroy

    redirect_to posts_path, status: :see_other
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def load_post
    @post = Post.find(params[:id])
  end
end
