class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    favourite       = Favourite.new
    post            = Post.find params[:post_id]
    favourite.post  = post
    favourite.user  = current_user
    if favourite.save
      redirect_to post_path(post), notice: "Added to favourites!"
    else
      redirect_to post_path(post), alert: "Already in your favourites"
    end
  end

  def destroy
    post        = Post.find params[:post_id]
    favourite   = current_user.favourites.find params[:id]
    favourite.destroy
    redirect_to post_path(post), notice: "Post removed!"
  end

end
