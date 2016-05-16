class LikesController < ApplicationController
  before_action :authenticate_user!
  before_action :post, only: [:create, :destroy]

  def create
    like          = Like.new
    like.post     = post
    like.user     = current_user
    respond_to do |format|
      if like.save
        format.html { redirect_to post_path(post), notice: "Thanks for liking!" }
        format.js   { render }
      else
        format.html { redirect_to post_path(post), alert: "Can't like! Liked already?" }
        format.js   { render js: "alert('Already in your likes, please refresh the page!');" }
      end
    end
  end

  def destroy
    like     = current_user.likes.find params[:id]
    like.destroy
    respond_to do |format|
      format.html { redirect_to post_path(post), notice: "Like removed!"}
      format.js   { render }
    end
  end


  private

  def post
    @post ||= Post.find params[:post_id]
  end



end
