class ImagesController < ApplicationController

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    @image = Image.new(image_params)
    if @image.save
      redirect_to image_path(@image), notice: 'Picture successfully uploaded'
    else
      render :new, notice: 'Something did not work correctly'
    end
  end

  def show
    @image = Image.find(params[:id])
  end

  def edit
    @image = Image.find(params[:id])
  end

  def update
    @image = Image.find(params[:id])
    if @image.update(image_params)
      redirect_to image_path(@image), notice: 'Image successfully updated'
    else
      render :edit
    end
  end

  def destroy
    Image.destroy(params[:id])
    redirect_to images_path, notice: 'Image was succesfully destroyed'
  end

  private

  def image_params
    params.require(:image).permit(:image, :title, :description)
  end
end
