class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def show
    @image = Image.find(params[:id])
    @comments = @image.comments
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
      flash[:notice] = "Image successfully added!"
      redirect_to profile_path(current_user.id)
    else
      render :new
    end
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      flash[:notice] = "Image successfully updated!"
      redirect_to  profile_path(current_user.id)
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Image successfully deleted!"
    redirect_to profile_path(current_user.id)
  end


private
  def image_params
    params.require(:image).permit(:title, :description, :user_id, :photo)
  end

end
