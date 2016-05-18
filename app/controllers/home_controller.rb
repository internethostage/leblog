class HomeController < ApplicationController

  def index
    @posts = Post.limit(3)
    render layout: "special_layout"
  end

  def about
  end
end
