class HomeController < ApplicationController

  def index
    @posts = Post.order("created_at desc" ).limit(5)
    render layout: "special_layout"
  end

  def about
  end
end
