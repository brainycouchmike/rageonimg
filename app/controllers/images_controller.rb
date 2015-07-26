class ImagesController < ApplicationController
  def index
    @images = Image.all
  end
  def create
    @image = Image.new(image_params)
    if @image.save
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end
  private
  def image_params
    params.require(:image).permit(:title,:date)
  end
end
