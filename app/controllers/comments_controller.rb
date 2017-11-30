class CommentsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @comment = Comment.new
  end

  def create
    @image = Image.find(params[:image_id])
    @comment = @image.comments.new(comment_params)
    if @comment.save
      flash[:notice] = "Comment successfully added!"
      redirect_to image_path(@image)
    else
      render :new
    end
  end

  def edit
    @comment = Comment.find(params[:id])
    @image = @comment.image
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      flash[:notice] = "Comment successfully updated!"
      redirect_to  image_path(@comment.image)
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    flash[:notice] = "Comment successfully deleted!"
    redirect_to image_path(@comment.image)
  end

  private
    def comment_params
      params.require(:comment).permit(:body, :image_id, :user_id)
    end
end
