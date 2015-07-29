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
    # @API_KEY  = "17d3ac47dcddfbd5dec5e0b37cdf1d7d"
    # @PASSWORD = "40cd7a26b4fab736d095bf415ad1b1bf"
    # @STORE    = "brainycouch"
    # RageOn Production Store
    @API_KEY = "a9d91bd9550a48555088054dc7d54fc6"
    @PASSWORD = "0bfcdcd24b8bb89927104663fb916f65"
    @STORE    = "rageon"
    shop_url  = "https://#{@API_KEY}:#{@PASSWORD}@#{@STORE}.myshopify.com/admin"
    ShopifyAPI::Base.site = shop_url
    @products = []
    @results  = []
    @total    = 0
    @errors   = 0
    @success  = 0
    base_path = File.expand_path('../assets/images/RageOnImgMgmt/', __FILE__)
    page      = 1
    count     = ShopifyAPI::Product.count
    if count > 0 then
      page += count.divmod(250).first
      while page > 0 do
        @products += ShopifyAPI::Product.find(:all, :params => {:limit => 250})
        page -= 1
      end
    end
    @count = count
    @procd = @products.length
    #byebug
    for product in @products
      pimage = product.images.first
      db_hash = {
        id: pimage.id,
        product_id: product.id,
        created_at: pimage.created_at,
        updated_at: pimage.updated_at,
        position: pimage.position,
        variant_ids: pimage.variant_ids.to_s,
        src: pimage.src,
        path: base_path+"/"+product.product_type+"/"+File.basename(URI.parse(pimage.src).path),
        lastmod: DateTime.now,
      }
      # byebug
      img = nil
      act = ""
      if !Image.find_by(id: pimage.id) then
        act "new"
        save_res = (img = Image.new(db_hash)).save
        # down_res = if !save_res then false else img.download end
        # @results.push({pimage.id => {"save"=>save_res, "dl"=>false}})
      else # Image found in database, check for update
        img = Image.find_by(id: pimage.id)
        if img != Image.new(db_hash) then
          act = "update"
          updt_res = img.update(db_hash)
          #down_res = if !updt_res then false else img.download end
          #@results.push({pimage.id => {"update"=>updt_res, "dl"=>down_res}})
        else # They're the same, no need to update
          act = "no-update"
        end
      end
      #code = img.download
      @results.push({img.id=>{"image"=>img,"action"=>act}})
      # Render on Download error (stop downloading if it's not working)
      # if !code.nil? and code != 200
      # render :fetch and return
      # Increment a total  
      @total+=1
    end
        @images = Image.all
        @links  = ActionLink.all
  end
      
      def download
        @image = Image.find(params[:img].id)
        @code  = @image.download
      end
      
  def push
    
  end
  private
  def image_params
    params.require(:image).permit(:title,:date)
  end
end
