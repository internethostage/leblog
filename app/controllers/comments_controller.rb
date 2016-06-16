class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post
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
    respond_to do |format|
      if @comment.save
        if @comment.user != @post.user
          CommentsMailer.notify_post_owner(@comment).deliver_later
        end
        format.html { redirect_to post_path(@post), notice: "Comment added successfully" }
        format.js { render :create_success }
      else
        format.html { render "/posts/show" }
        format.js { render :create_failure }
      end
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
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
        format.js   { render }
      end
    else
      render :edit
    end
  end

  def destroy
  @post = Post.find params[:post_id]
  @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post) }
      format.js { render }
    end
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
