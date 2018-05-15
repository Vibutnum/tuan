# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Groupon::Coupon.create!([
#   {
#     name: "Ralph Lauren军绿色儿童棒球帽108.8元",
#     description: "本季，时尚大牌Ralph Lauren在延续大牌经典的同时特推出时尚童装系列。本款Ralph Lauren军绿色儿童棒球帽，军绿色延续大牌沉稳简约，黄色刺绣logo经典而不失品味，为您打造属于宝宝的独特新时尚。是潮爸潮妈时尚首选。",
#     product_id: 7139,
#     price: 132,
#     discount: 108.8,
#     minimum: 3,
#     published: false,
#   },
#   {
#     name: "Friendship Montblanc万宝龙黑色12支装一次性墨水胆68.8元",
#     description: "Montblanc万宝龙一次性墨水胆采用优质油墨作为原料，无毒环保，墨迹坚牢，书写流畅。适用于所有Montblanc万宝龙墨胆芯墨水笔。包装轻便安全， 方便收纳，也可于差旅出行时随身携带备用。",
#     product_id: 2535772,
#     price: 80,
#     discount: 68.8,
#     minimum: 5,
#     published: true,
#   },
#   {
#     name: "【11月1日发货】Friendship 高情厚谊36.9元",
#     description: "寓意吉祥的雀鸟搭配深沉大气的紫色，精巧别致的层叠设计感，为您奉上朋友心中紫气东来的美好祝愿。优众心意信笺套装，用古典的蜡封与精致的金色纹理，珍藏住你的字字心意。优众尊享礼品包装——Friendship高情厚谊，知音间深远久长的情义。",
#     product_id: 3738557,
#     price: 50,
#     discount: 38.9,
#     minimum: 5,
#     published: true,
#   },
#   {
#     name: "【11月1日发货】Romantic 情有独钟36.9元",
#     description: "浓情的粉邂逅甜蜜的蓝，在清新的乳白色底调中碰撞出独一无二的爱恋心声。搭配优众心意信笺套装，用古典的蜡封与精致的金色纹理，珍藏住你的字字心意。 优众尊享礼品包装——Romantic情有独钟，献给你的专属挚爱。",
#     product_id: 3738357,
#     price: 50,
#     discount: 36.9,
#     minimum: 5,
#     published: true,
#   },
#   {
#     name: "【11月1日发货】Birthday 庆生祝愿38.9元",
#     description: "俏皮的人偶，炫丽的烟花，缤纷的色彩交错间带给你最欢快的生日派对景象。搭配优众心意信笺套装，用古典的蜡封与精致的金色纹理，珍藏住你的字字心意。优众尊享礼品包装——Birthday庆生祝愿，岁岁好运共享欢欣。",
#     product_id: 3738457,
#     price: 50,
#     discount: 36.9,
#     minimum: 3,
#     published: true,
#   },
# ])

daily_paper = DailyPaper.new

daily_paper.send(:set_redis_data, daily_paper.send(:get_sql_data, Date.yesterday - 1.days), Date.yesterday - 1.days)