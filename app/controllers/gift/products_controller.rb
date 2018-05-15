class Gift::ProductsController < Gift::ApplicationController
  def index
    @banners = (Data::Common::File.banners(DATA_CONFIG['gift_file_id']) rescue [])
    
    data_products = data_files
    
    @products = begin
      data_products.map do |product|
          {
            "title" => product["title"],
            "products" => Auction::Product.published.where(id: product["products"]).order(items_unsold_count: :desc, id: :asc).limit(4)
          }
      end
      
    rescue => e
      logger.error %[#{e.class.to_s} (#{e.message}):\n\n #{e.backtrace.join("\n")}\n\n]
      nil
    end
    
    @product_icons = brand_zh.invert
  end
  
  def show
    begin
      check_product params[:id]
    rescue
      return redirect_to(gift_products_path)
    end
    @product = Auction::Product.published.find(params[:id])
    @product_img = %w(major_pic images).map{ |img| @product.try(img.intern) }.flatten.compact.collect{ |image| (image.large rescue image) }.compact.map { |i| i + ".m600.jpg" }
  end
  
  def brand
    @products = data_files.detect{ |d| d["title"] == brand_zh[params[:which_brand]] }
    raise ActiveRecord::RecordNotFound if @products.blank?
    @products["products"] = Auction::Product.published.where(id: (@products["products"] || [])).order(items_unsold_count: :desc, id: :asc)
  end
  
  private
    def brand_zh
      {
        "parents"  => "送长辈",
        "children" => "送小孩",
        "friends"  => "送好友",
        "mate"     => "送伴侣"
      }
    end
    
    def data_files
      (Data::Common::File.banners(DATA_CONFIG['gift_products_file_id']) rescue [])
    end
end
