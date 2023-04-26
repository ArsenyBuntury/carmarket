class PostsController < ApplicationController
  before_action :current_user
  before_action :current_user, except: %i[index show]
  before_action :load_post, only: %w[show edit update destroy]

  def index
    
    page = params[:page].present? ? params[:page] : 1

  @posts = Post.order(created_at: :desc)

  @posts = @posts.where(user_id: current_user.id) if params[:my_posts] == '1'
  @posts = @posts.where("title LIKE ?", "%#{params[:search]}%") if params[:search].present?

  @posts = @posts.page(page)
   # if params[:search]
    #  @posts = Post.where("title LIKE ?", "%#{params[:search]}%").order(created_at: :desc).page params[:page]
    #else
     # @posts = Post.order(created_at: :desc)
    #user_id = params[:my_posts] == 0 ? current_user.id : nil
    #@posts = user_id.nil? ? @posts.where("user_id LIKE ?", "#{user_id}").order(created_at: :desc) : posts
    #@posts.page params[:page]
    #end
    
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
    if current_user == @post.user
    if @post.update(post_params)
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
