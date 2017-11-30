class TagsController < ApplicationController
  def new
    @image = Image.find(params[:image_id])
    @tag = Tag.new
    @users = User.all
  end

  def create
    @image = Image.find(params[:image_id])
    @tag = @image.tags.new(tag_params)
    if @tag.save
      flash[:notice] = "Tag successfully added!"
      redirect_to image_path(@image)
    else
      render :new
    end
  end

  def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    flash[:notice] = "Tag successfully deleted!"
    redirect_to image_path(@tag.image)
  end

  private
    def tag_params
      params.require(:tag).permit(:image_id, :user_id)
    end
  end
