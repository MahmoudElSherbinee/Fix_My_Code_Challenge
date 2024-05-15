class PostsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  

  def index
    @posts = Post.all.order('created_at DESC')
  end
@@ -30,7 +30,7 @@ def edit
  def update
    @post = Post.find(params[:id])

    if @post.update(params[:post].permit(:title, :body))
    if @post.update(params[:post].permit(:title, :body, :online))
      redirect_to @post
    else
      render 'edit'
@@ -46,6 +46,6 @@ def destroy

  private
    def post_params
      params.require(:post).permit(:title, :body)
      params.require(:post).permit(:title, :body, :online)
    end
end
