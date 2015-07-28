class ImagesController < ApplicationController
  def index
    @images = Image.all
    @links  = ActionLink.all
  end
  def create
    @image = Image.new(image_params)
    if @image.save
      render json: @image
    else
      render json: @image.errors, status: :unprocessable_entity
    end
  end
  def fetch
    @API_KEY  = "17d3ac47dcddfbd5dec5e0b37cdf1d7d"
    @PASSWORD = "40cd7a26b4fab736d095bf415ad1b1bf"
    @STORE    = "brainycouch"
    shop_url  = "https://#{@API_KEY}:#{@PASSWORD}@#{@STORE}.myshopify.com/admin"
    ShopifyAPI::Base.site = shop_url
    @products = ShopifyAPI::Product.find(:all)
  end
  private
  def image_params
    params.require(:image).permit(:title,:date)
  end
end
