class PostsController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def new
    @post = Post.new
  end

  def create
    @post = Post.create post_params

    if @post.save
      redirect_to post_path(@post), notice: "Post created successfully"
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
  end

  def index
    # @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at").paginate(:page => params[:page], :per_page => 10)
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 10)
    end
  end

  def edit
  end

  def update
    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end


private

  def post_params
    params.require(:post).permit(:title, :body, :category_id)
  end

  def find_post
    @post = Post.find params[:id]
  end


end
