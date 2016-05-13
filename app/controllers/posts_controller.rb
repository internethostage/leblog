class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy]


  def new
    @post = Post.new
  end

  def create
    @post = Post.create post_params
    @user = @current_user
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post), notice: "Post created successfully"
    else
      flash.now[:alert] = "There wasn an error, please check details..."
      render :new
    end
  end

  def show
    @comment = Comment.new
      if @post.category_id
         @category = Category.find(@post.category_id).title.titleize
      else
        @category = "Not specified"
      end
    respond_to do |format|
      format.html {render}
      format.json  { render :json => {:post => @post,
                                      :comments => @post.comments,
                                      :user => @post.user
                                      }}
    end
  end

  def index
    # @posts = Post.all
    if params[:search]
      @posts = Post.search(params[:search]).order("created_at").paginate(:page => params[:page], :per_page => 10)
    else
      @posts = Post.paginate(:page => params[:page], :per_page => 10)
    end
    respond_to do |format|
      format.html {render}
      # format.json  { render :json => {posts: Post.all.as_json(methods: :body_snippet,
      #                                                                     only: [:id, :title,])}}
      # alternative way to achieve above, but 3-5x slower
      format.json {paginate json: Post.select([:body, :id, :title]), per_page:5, methods: [:body_snippet], only: [:id, :title, :body_snippet]}
        # posts = Post.all
        #
        # format.json { paginate json: posts, per_page: 5 }

    end
  end

  def edit
    redirect_to root_path, alert: "Access denied" unless can? :edit, @post
  end

  def update
    redirect_to root_path, alert: "Access denied" unless can? :update, @post
    if @post.update post_params
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path, alert: "Access denied" unless can? :destroy, @post
    @post.destroy
    redirect_to posts_path
  end


private

  def post_params
    params.require(:post).permit(:title, :body, :category_id, {tag_ids:[]})
  end

  def find_post
    @post = Post.find params[:id]
  end


end
