class CommentsController < ApplicationController

  def new; end

  def create
    @comment = Comment.new(comment_params)
    @provider = Provider.find(params[:id])
    @comment.provider_id = @provider.id
    redirect_back(fallback_location: users_path) if @comment.save!
  end

  private

  def comment_params
    params.require(:comment).permit(:provider_id, :user_id, :body)
  end

end
