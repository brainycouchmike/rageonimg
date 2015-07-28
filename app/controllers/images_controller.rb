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
    # Testing Store
    @API_KEY  = "17d3ac47dcddfbd5dec5e0b37cdf1d7d"
    @PASSWORD = "40cd7a26b4fab736d095bf415ad1b1bf"
    @STORE    = "brainycouch"
    # RageOn Production Store
    # @API_KEY = "a9d91bd9550a48555088054dc7d54fc6"
    # @PASSWORD = "0bfcdcd24b8bb89927104663fb916f65"
    # @STORE    = "rageon"
    shop_url  = "https://#{@API_KEY}:#{@PASSWORD}@#{@STORE}.myshopify.com/admin"
    ShopifyAPI::Base.site = shop_url
    @products = ShopifyAPI::Product.find(:all)
    @result   = []
    base_path = "/Users/staff/Documents/Projects/RageOnImgMgmt/"
    for product in @products
      pimage = product.images[0]
      db_hash = {
        id: pimage.id,
        product_id: product.id,
        created_at: pimage.created_at,
        updated_at: pimage.updated_at,
        position: pimage.position,
        variant_ids: pimage.variant_ids.to_s,
        src: pimage.src,
        path: base_path+product.product_type+File.basename(URI.parse(pimage.src).path),
        lastmod: DateTime.now,
      }
      byebug
      if !Image.find_by(id: pimage.id) then
        @result.push(Image.new(db_hash).save)
      else
        img = Image.find_by(id: pimage.id)
        if img.updated_at != pimage.updated_at
          @result.push(Image.udpate("#{pimage.id}" => db_hash).save)
        end
      end
    end
  end
  private
  def image_params
    params.require(:image).permit(:title,:date)
  end
end
