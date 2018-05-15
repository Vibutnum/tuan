class Groupon::Coupon < ActiveRecord::Base
  acts_as_paranoid
  
  belongs_to :product, class_name: 'Auction::Product', foreign_key: 'product_id'
  scope :published, -> { where(published: true) }
  scope :ordered, -> { order position: :desc }
  
  scope :listable_coupons, -> { where listable: true }
  
  scope :red_packet, -> { where is_redpack: true }
  
  scope :not_red_packet, -> { where is_redpack: false }
  
  def product_pics
    %w(major_pic images).map{ |img| product.try(img.intern) }.flatten.compact.collect{ |image| (image.large rescue image) }.compact.map { |i| i + ".m600.jpg" }
  end
  
  def sold_out?
    product.try(:items_unsold_count).to_i <= 0
  end
  
  def cannot_buy_grouped?
    product.try(:items_unsold_count).to_i < minimum.to_i
  end
  
end