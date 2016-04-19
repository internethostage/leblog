class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
  before_action :find_comment
  before_action :find_and_authorize_comment, only: :destroy


  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find params[:post_id]
    @comment = Comment.create comment_params
    @comment.post = @post
    @user = current_user
    @comment.user = @user
    if @comment.save
      redirect_to post_path(@post), notice: "Comment added successfully"
    else
      render "/posts/show"
    end
  end


  def show
    @comment = Comment.find(params[:id])
  end

  def index
    @comments = Comment.all
  end

  def edit
  end

  def update
    if @comment.update comment_params
      redirect_to comment_path(@comment)
    else
      render :edit
    end
  end

  def destroy
  @post = Post.find params[:post_id]
  @comment.destroy
  redirect_to post_path(@post)
  end



private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_post
    @post = Post.find params[:post_id]
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

  def find_and_authorize_comment
    @comment = @post.comments.find params[:id]
    head :unauthorized unless (can? :destroy, @comment) || (can? :manage, @comment)
  end


end
