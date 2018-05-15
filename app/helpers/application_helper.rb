module ApplicationHelper
  # 格式化显示时间
  def formatted_datetime(t)
    t.present? ? t.strftime("%Y-%m-%d %H:%M:%S") : ""
  end

  def formatted_time(t)
    t.present? ? t.strftime("%m-%d %H:%M:%S") : ""
  end

  def image_domain
    "http://i#{0.upto(3).to_a.sample.to_s}.ihaveu.com"
  end

  def ihaveu_domain
    "http://#{DOMAIN_CONFIG['ihaveu']}"
  end

  def dynamic_text
    [
      '不用剁手，一起来省！',
      '不用拼爹，拼团也是极好的~',
      '速速来拼团，没钱也任性~',
      '一日之计在于晨，省钱之计在于团~',
      '集齐小伙伴，即可召唤“省龙”哦~',
      '为了团也是够拼的，赶紧叫上几个小伙伴~',
      '重要的事情说三遍，叫叫叫上小伙伴~',
      '想你时你在脑海，想团时你来眼前~',
      '缺啥别缺友情，小伙伴们！都过来~'
    ].sample
  end

  def get_provinces
    @provinces ||= Rails.cache.fetch(province_cache_key, province_cache_expires_in){ Auction::Province.available.map{ |province| [province.name, province.name] }.uniq }
  end

  def get_cities(province_name)
    @cities ||= Rails.cache.fetch(city_cache_key(province_name), city_cache_expires_in) do
      get_areas("province", "city", province_name)
    end.map{ |city| [city[:name], city[:name]] }
  end

  def get_towns(city_name)
    @towns ||= Rails.cache.fetch(town_cache_key(city_name), town_cache_expires_in) do
      get_areas("city", "town", city_name)
    end.map{ |town| [town[:name], town[:name]] }
  end

  def banners(id)
    @banners ||= Data::Common::File.banners(id)
  end

  def markdown_to_html(m)
    Redcarpet::Markdown.new(Redcarpet::Render::HTML).render(m).html_safe rescue ''
  end
end
