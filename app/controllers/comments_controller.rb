class CommentsController < ApplicationController
  def create
    @picture = Picture.find(params[:picture_id])
    
    @comment = @picture.comments.build(comment_params)
    
    respond_to do |format|
      if @comment.save
        format.js { render :index}
      else 
        format.html { redirect_to picture_path(@picture), notice: "投稿エラー"}
      end
    end
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:picture_id, :content)
  end
  
end