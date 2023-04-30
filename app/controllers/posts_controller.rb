class PostsController < ApplicationController
  before_action :current_user
  before_action :current_user, except: %i[index show]
  before_action :load_post, only: %w[show edit update destroy]

  def index
  page = params[:page].present? ? params[:page] : 1

  @posts = Post.order(created_at: :desc)
    if current_user!= nil
  @posts = @posts.where(user_id: current_user.id) if params[:my_posts] == "1"
  @posts = @posts.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?
    end
  @posts = @posts.page(page)
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
    
    if current_user == @post.user
    if @post.update(post_params) || @post.image.attach(params[:post][:image])
      redirect_to @post
    else
      render :edit, status: :unprocessable_entity
    end
  else
    redirect_to post_path, alert: "You don't have permission to do that."
  end
  end

  def destroy
    if current_user == @post.user
    @post.destroy

    redirect_to posts_path, status: :see_other
    else
    redirect_to post_path, alert: "You don't have permission to do that."
  end
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def load_post
    @post = Post.find(params[:id])
  end
end
