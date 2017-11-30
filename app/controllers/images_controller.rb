class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def new
    if current_user
      @user = current_user
      @image = @user.images.new
    else
      @user = 'none'
    end
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      flash[:notice] = "Post successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end

private
  def image_params
    params.require(:image).permit(:title, :description, :user_id, :photo)
  end

end
