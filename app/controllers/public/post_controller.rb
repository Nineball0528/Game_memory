class Public::PostController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to post_index_path
    else
      render :new
    end
  end

  def index
    @post = Post.all
  end

  def search
    if params[:title].present?
      @post = Post.where('title LIKE ?', "%#{params[:title]}%")
    else
      @post = Post.none
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post =Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_index_path
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end


 private

 def post_params
   params.require(:post).permit(:user_id, :post_comment_id, :image, :good_id, :title, :introduction, :active_status)
 end

end
