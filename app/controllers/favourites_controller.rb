class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :post, only: [:create, :destroy]

  def create
    favourite       = Favourite.new
    favourite.post  = post
    favourite.user  = current_user
    respond_to do |format|
      if favourite.save
        format.html { redirect_to post_path(post), notice: "Added to favourites!" }
        format.js { render }
      else
        format.html { redirect_to post_path(post), alert: "Already in your favourites" }
        format.js { render js: "alert('Already in your favourites, please refresh the page!');" }
      end
    end
  end

  def destroy
    favourite   = current_user.favourites.find params[:id]
    favourite.destroy
    respond_to do |format|
      format.html { redirect_to post_path(post), notice: "Post removed!" }
      format.js { render }
    end
  end

  private

  def post
  @post ||= Post.find params[:post_id]
  end

end
