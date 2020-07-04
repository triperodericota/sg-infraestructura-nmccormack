class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy, :previous]

  # GET /posts
  def index
    @posts = Post.all.order(created_at: :desc).page params[:page]
  end

  def latest
    @post = Post.latest_published
  end

  def previous
    @post = Post.previous_published(@post)

    if @post
      render :latest
    else
      redirect_to latest_posts_path, alert: t('.error')
    end
  end

  # GET /posts/1
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_url, notice: t('.notice') 
    else
      render :new
    end
  end

  # PATCH/PUT /posts/1
  def update
    if @post.update(post_params)
      redirect_to posts_url, notice: t('.notice')
    else
      render :edit
    end
  end

  # DELETE /posts/1
  def destroy
    @post.destroy

    redirect_to posts_url, notice: t('.notice')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :body, :published)
    end
end
