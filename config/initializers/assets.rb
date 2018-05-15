# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

path = %w{
  application.css
  groupon/coupons/index.css
  groupon/coupons/show.css
  shared/touchslider.js
  shared/touchslide.js
  groupon/groups/index.css
  groupon/groups/show.css
  auction/contacts/form.css
  auction/contacts/index.css
  auction/contacts/form.js
  ucenter.css
  gift/products/index.css
  gift/trades/new.css
  gift/trades/get.css
  gift/trades/forward.css
  gift/trades/receiving_gifts.css
  gift/trades/index.css
  gift/trades/common.css
  gift/trades/received_results.css
  gift/trades/gift_show.css
  auction/trades/defray.css
  auction/trades/closely_gift.css
  gift/products/show.css
  wechat/invitations/index.css
}

Rails.application.config.assets.precompile += path
