class CommentsController < ApplicationController
  def create
# render plain: params[:comment].inspect
# render plain: params.inspect
  @package = Package.find(params[:package_id])
  @comment = @package.comments.create(comment_params)
  redirect_to package_path(@package)
end

def destroy
   @package = Package.find(params[:package_id])
   @comment = @package.comments.find(params[:id])
   @comment.destroy
   redirect_to package_path(@package)
 end

private
  def comment_params
    params.require(:comment).permit(:commenter, :body, :available)
  end
end
