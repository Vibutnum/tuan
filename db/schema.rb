# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160226075740) do

  create_table "aaexample_autoincrement", force: :cascade do |t|
    t.integer  "trade_id",   limit: 4
    t.string   "status",     limit: 50
    t.datetime "created_at",            null: false
  end

  create_table "about_articles", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.text     "content",             limit: 65535
    t.string   "pic",                 limit: 255
    t.integer  "category_id",         limit: 4
    t.datetime "original_created_at"
    t.datetime "original_updated_at"
    t.boolean  "published",                         default: false, null: false
    t.boolean  "active",                            default: true,  null: false
    t.integer  "lock_version",        limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "about_articles", ["active", "published", "category_id"], name: "index_about_articles_on_published_and_category_id", using: :btree

  create_table "about_jobs", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.string   "location",       limit: 255
    t.text     "responsibility", limit: 65535
    t.text     "qualification",  limit: 65535
    t.integer  "sequence",       limit: 4
    t.integer  "editor_id",      limit: 4
    t.boolean  "published",                    default: false, null: false
    t.boolean  "active",                       default: true,  null: false
    t.integer  "lock_version",   limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "about_links", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "pic",              limit: 255
    t.string   "pic_file_name",    limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.string   "pic_content_type", limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
    t.string   "url",              limit: 255
    t.integer  "sequence",         limit: 4
    t.integer  "editor_id",        limit: 4
    t.boolean  "published",                    default: false, null: false
    t.boolean  "active",                       default: true,  null: false
    t.integer  "lock_version",     limit: 4,   default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "about_people", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.string   "pic",              limit: 255
    t.string   "url",              limit: 255
    t.integer  "editor_id",        limit: 4
    t.boolean  "published",                      default: false, null: false
    t.boolean  "active",                         default: true,  null: false
    t.integer  "lock_version",     limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name",    limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.string   "pic_content_type", limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
  end

  create_table "about_users", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "sex",          limit: 255
    t.string   "pic",          limit: 255
    t.datetime "birthday"
    t.text     "friend_ids",   limit: 65535
    t.datetime "login_at"
    t.integer  "lock_version", limit: 4,     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_activities", force: :cascade do |t|
    t.integer  "editor_id",           limit: 4
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "url",                 limit: 255
    t.string   "pic",                 limit: 255
    t.string   "banner",              limit: 255
    t.integer  "manager_id",          limit: 4
    t.integer  "mail_id",             limit: 4
    t.integer  "page_id",             limit: 4
    t.integer  "market_id",           limit: 4
    t.integer  "promotion_id",        limit: 4
    t.integer  "coupon_id",           limit: 4
    t.string   "event_ids",           limit: 255
    t.text     "remark",              limit: 65535
    t.boolean  "active",                            default: true,  null: false
    t.boolean  "published",                         default: false, null: false
    t.integer  "lock_version",        limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name",       limit: 255
    t.integer  "pic_file_size",       limit: 4
    t.string   "pic_content_type",    limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",     limit: 4
    t.integer  "pic_image_height",    limit: 4
    t.string   "banner_file_name",    limit: 255
    t.integer  "banner_file_size",    limit: 4
    t.string   "banner_content_type", limit: 255
    t.datetime "banner_updated_at"
    t.integer  "banner_image_width",  limit: 4
    t.integer  "banner_image_height", limit: 4
  end

  create_table "auction_ads", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "promotion_id", limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "active",                     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,     default: 0
  end

  create_table "auction_attributes", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "name",         limit: 255
    t.text     "option_list",  limit: 65535
    t.boolean  "searchable",                 default: false, null: false
    t.boolean  "active",                     default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,     default: 0
  end

  add_index "auction_attributes", ["active", "id"], name: "by_active_and_id", using: :btree

  create_table "auction_attributes_20110303", force: :cascade do |t|
    t.integer  "editor_id",   limit: 4
    t.string   "name",        limit: 255
    t.text     "option_list", limit: 65535
    t.boolean  "searchable",                default: false, null: false
    t.boolean  "active",                    default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_behaviors", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "object_type",  limit: 255
    t.integer  "object_id",    limit: 4
    t.text     "referrers",    limit: 65535
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_behaviors", ["object_type", "object_id"], name: "by_object_type_and_object_id", using: :btree

  create_table "auction_bidders", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "good_id",       limit: 4
    t.integer  "current_point", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",  limit: 4, default: 0
  end

  add_index "auction_bidders", ["good_id", "current_point"], name: "index_auction_bidders_on_good_id_and_current_point", using: :btree
  add_index "auction_bidders", ["user_id", "good_id"], name: "index_auction_bidders_on_user_id_and_good_id", using: :btree

  create_table "auction_biddings", force: :cascade do |t|
    t.integer  "bidder_id",     limit: 4
    t.integer  "current_point", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "good_id",       limit: 4
    t.integer  "user_id",       limit: 4
    t.integer  "lock_version",  limit: 4, default: 0
  end

  add_index "auction_biddings", ["bidder_id"], name: "index_auction_biddings_on_bidder_id", using: :btree

  create_table "auction_brand_images", force: :cascade do |t|
    t.string   "pic",              limit: 255
    t.string   "pic_file_name",    limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.string   "pic_content_type", limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
    t.integer  "sequence",         limit: 4
    t.integer  "brand_id",         limit: 4
    t.boolean  "active",                       default: true, null: false
    t.integer  "lock_version",     limit: 4,   default: 0,    null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "auction_brands", force: :cascade do |t|
    t.integer  "editor_id",           limit: 4
    t.string   "name",                limit: 255
    t.string   "chinese",             limit: 255
    t.string   "abbreviation",        limit: 255
    t.string   "pic",                 limit: 255
    t.string   "website",             limit: 255
    t.text     "description",         limit: 65535
    t.integer  "order",               limit: 4,     default: 1
    t.string   "recommend",           limit: 255
    t.boolean  "published",                         default: false, null: false
    t.boolean  "active",                            default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link",                limit: 255
    t.string   "initial",             limit: 255
    t.string   "swf",                 limit: 255
    t.string   "swf2",                limit: 255
    t.integer  "lock_version",        limit: 4,     default: 0
    t.string   "title",               limit: 255
    t.string   "pronunciation",       limit: 255
    t.integer  "country_id",          limit: 4
    t.datetime "founded_on"
    t.string   "keywords",            limit: 255
    t.string   "special_product_ids", limit: 255
    t.boolean  "introduced"
    t.integer  "year",                limit: 4
    t.string   "shop_link",           limit: 255
    t.string   "genre",               limit: 255
    t.string   "material",            limit: 255
    t.text     "summary",             limit: 65535
  end

  add_index "auction_brands", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_brands", ["active", "published", "created_at"], name: "by_active_and_published_created_at", using: :btree

  create_table "auction_brands_20110303", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "name",         limit: 255
    t.string   "chinese",      limit: 255
    t.string   "abbreviation", limit: 255
    t.string   "pic",          limit: 255
    t.string   "website",      limit: 255
    t.text     "description",  limit: 65535
    t.integer  "order",        limit: 4,     default: 1
    t.string   "recommend",    limit: 255
    t.boolean  "published",                  default: false, null: false
    t.boolean  "active",                     default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "link",         limit: 255
    t.string   "initial",      limit: 255
    t.string   "swf",          limit: 255
  end

  create_table "auction_calls", force: :cascade do |t|
    t.integer  "editor_id",           limit: 4
    t.integer  "trade_id",            limit: 4
    t.integer  "costumer_id",         limit: 4
    t.string   "identifier",          limit: 255
    t.string   "operator_identifier", limit: 255
    t.string   "queue_identifier",    limit: 255
    t.string   "calling_no",          limit: 255
    t.string   "called_no",           limit: 255
    t.string   "enterprise_no",       limit: 255
    t.string   "direction",           limit: 255
    t.datetime "started_at"
    t.string   "duration",            limit: 255
    t.string   "total_duration",      limit: 255
    t.string   "recording",           limit: 255
    t.text     "remark",              limit: 65535
    t.boolean  "active",                            default: true, null: false
    t.integer  "lock_version",        limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "answer",              limit: 255
    t.string   "calling_area",        limit: 255
    t.text     "inquiry",             limit: 65535
    t.text     "complaint",           limit: 65535
    t.text     "returns",             limit: 65535
  end

  add_index "auction_calls", ["calling_no"], name: "index_auction_calls_on_calling_no", using: :btree
  add_index "auction_calls", ["identifier"], name: "index_auction_calls_on_identifier", using: :btree
  add_index "auction_calls", ["trade_id"], name: "index_auction_calls_on_trade_id", using: :btree

  create_table "auction_cards", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "number",       limit: 255
    t.string   "password",     limit: 255
    t.integer  "value",        limit: 4
    t.integer  "balance",      limit: 4
    t.integer  "price",        limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "user_id",      limit: 4
    t.text     "remark",       limit: 65535
    t.integer  "editor_id",    limit: 4
    t.boolean  "published",                  default: false, null: false
    t.boolean  "active",                     default: true,  null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "shop_id",      limit: 4
  end

  add_index "auction_cards", ["active", "published", "user_id", "started_at", "ended_at", "balance"], name: "by_active_and_published_and_user_id_and_started_at_and_balance", using: :btree

  create_table "auction_categories", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "name",               limit: 255
    t.text     "measures",           limit: 65535
    t.boolean  "active",                           default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",       limit: 4,     default: 0
    t.integer  "parent_id",          limit: 4
    t.text     "description",        limit: 65535
    t.string   "ranges",             limit: 255
    t.integer  "order",              limit: 4,     default: 1
    t.boolean  "published",                        default: false, null: false
    t.string   "attribute_ids",      limit: 255
    t.boolean  "female",                           default: false, null: false
    t.boolean  "male",                             default: false, null: false
    t.string   "measure_properties", limit: 255
    t.string   "measure_pic",        limit: 255
    t.integer  "bust_offset",        limit: 4
    t.integer  "bust_error",         limit: 4
    t.integer  "waistline_offset",   limit: 4
    t.integer  "waistline_error",    limit: 4
    t.integer  "hip_offset",         limit: 4
    t.integer  "hip_error",          limit: 4
    t.integer  "shoulder_offset",    limit: 4
    t.integer  "shoulder_error",     limit: 4
    t.integer  "arm_offset",         limit: 4
    t.integer  "arm_error",          limit: 4
    t.integer  "leg_offset",         limit: 4
    t.integer  "leg_error",          limit: 4
    t.string   "priority",           limit: 255
    t.string   "contrast_pic",       limit: 255
    t.string   "pic",                limit: 255
    t.string   "pic_file_name",      limit: 255
    t.string   "pic_content_type",   limit: 255
    t.integer  "pic_file_size",      limit: 4
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",    limit: 4
    t.integer  "pic_image_height",   limit: 4
  end

  add_index "auction_categories", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_categories", ["active", "published", "created_at"], name: "by_active_and_published_and_created_at", using: :btree

  create_table "auction_categories_20101210", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "measures",     limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_categories_20110303", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "name",          limit: 255
    t.string   "measures",      limit: 255
    t.boolean  "active",                      default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",  limit: 4,     default: 0
    t.integer  "parent_id",     limit: 4
    t.text     "description",   limit: 65535
    t.string   "ranges",        limit: 255
    t.integer  "order",         limit: 4,     default: 1
    t.boolean  "published",                   default: false, null: false
    t.string   "attribute_ids", limit: 255
    t.boolean  "female",                      default: false, null: false
    t.boolean  "male",                        default: false, null: false
  end

  create_table "auction_chances", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "lottery_id",   limit: 4
    t.integer  "ticket_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4, default: 0
  end

  add_index "auction_chances", ["user_id", "lottery_id", "ticket_id"], name: "index_auction_chances_on_user_id_and_lottery_id_and_ticket_id", using: :btree

  create_table "auction_chats", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "topic",        limit: 255
    t.string   "appellation",  limit: 255
    t.string   "phone",        limit: 255
    t.string   "source",       limit: 255
    t.string   "ip",           limit: 255
    t.text     "content",      limit: 65535
    t.integer  "user_id",      limit: 4
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
    t.string   "status",       limit: 255
    t.string   "remark",       limit: 255
  end

  create_table "auction_chats_messages", force: :cascade do |t|
    t.text     "content",      limit: 65535
    t.integer  "chat_id",      limit: 4
    t.boolean  "active",                     default: true,  null: false
    t.boolean  "to_user",                    default: false, null: false
    t.boolean  "readed",                     default: false, null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "auction_cities", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "province_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.integer  "order",        limit: 4,   default: 1
    t.integer  "lock_version", limit: 4,   default: 0
    t.boolean  "published",                default: false, null: false
    t.string   "postcode",     limit: 255
  end

  add_index "auction_cities", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_cities", ["province_id"], name: "index_auction_cities_on_province_id", using: :btree

  create_table "auction_cities_20101210", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "province_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.integer  "order",        limit: 4,   default: 1
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_clicks", force: :cascade do |t|
    t.integer  "link_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "referrer",     limit: 255
    t.string   "ip",           limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url",          limit: 255
    t.string   "agent",        limit: 255
    t.string   "path",         limit: 255
    t.integer  "lock_version", limit: 4,   default: 0
    t.string   "session_key",  limit: 255
  end

  add_index "auction_clicks", ["link_id"], name: "index_auction_clicks_on_link_id", using: :btree

  create_table "auction_collocations", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "gender",       limit: 255
    t.string   "occasion",     limit: 255
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.string   "bg_color",     limit: 255
    t.string   "bg_pic",       limit: 255
    t.string   "list_pic",     limit: 255
    t.string   "swf",          limit: 255
    t.string   "pic",          limit: 255
    t.text     "product_ids",  limit: 65535
    t.boolean  "active",                     default: true, null: false
    t.boolean  "published"
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "bg_pic2",      limit: 255
  end

  create_table "auction_contacts", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.string   "name",             limit: 255
    t.string   "country",          limit: 255
    t.string   "province",         limit: 255
    t.string   "city",             limit: 255
    t.string   "town",             limit: 255
    t.string   "address",          limit: 255
    t.string   "postcode",         limit: 255
    t.string   "phone",            limit: 255
    t.string   "mobile",           limit: 255
    t.boolean  "active",                         default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",     limit: 4,     default: 0
    t.integer  "editor_id",        limit: 4
    t.string   "delivery_service", limit: 255
    t.text     "remark",           limit: 65535
    t.string   "id_number",        limit: 255
  end

  add_index "auction_contacts", ["active", "user_id", "created_at"], name: "by_active_user_id_created_at", using: :btree

  create_table "auction_costumers", force: :cascade do |t|
    t.integer  "editor_id",             limit: 4
    t.integer  "user_id",               limit: 4
    t.string   "mobile",                limit: 255
    t.string   "phone",                 limit: 255
    t.string   "name",                  limit: 255
    t.string   "title",                 limit: 255
    t.text     "remark",                limit: 65535
    t.boolean  "active",                              default: true, null: false
    t.integer  "lock_version",          limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "queue_id",              limit: 4
    t.integer  "primary_operator_id",   limit: 4
    t.integer  "secondary_operator_id", limit: 4
    t.integer  "city_id",               limit: 4
    t.integer  "year",                  limit: 4
    t.integer  "month",                 limit: 4
    t.integer  "day",                   limit: 4
    t.string   "communication",         limit: 255
    t.string   "color",                 limit: 255
    t.string   "brand_ids",             limit: 255
    t.text     "like",                  limit: 65535
    t.text     "hate",                  limit: 65535
    t.text     "clothing",              limit: 65535
  end

  add_index "auction_costumers", ["active", "user_id"], name: "index_auction_costumers_on_active_and_user_id", using: :btree

  create_table "auction_countries", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.integer  "order",        limit: 4,   default: 1
    t.integer  "lock_version", limit: 4,   default: 0
    t.boolean  "published",                default: false, null: false
    t.string   "pic",          limit: 255
  end

  add_index "auction_countries", ["active", "id"], name: "by_active_and_id", using: :btree

  create_table "auction_countries_20101210", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.integer  "order",        limit: 4,   default: 1
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_coupons", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "code",         limit: 255
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "limitation",   limit: 4
    t.string   "function",     limit: 255
    t.integer  "point",        limit: 4
    t.boolean  "published",                  default: false, null: false
    t.boolean  "active",                     default: true,  null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "event_id",     limit: 4
    t.string   "event_ids",    limit: 255
  end

  add_index "auction_coupons", ["active", "published", "code"], name: "by_active_and_published_and_code", using: :btree

  create_table "auction_customs_entries", force: :cascade do |t|
    t.integer  "trade_id",          limit: 4
    t.boolean  "success"
    t.string   "alipay_declare_no", limit: 255
    t.text     "data",              limit: 65535
    t.integer  "lock_version",      limit: 4,     default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  add_index "auction_customs_entries", ["trade_id"], name: "index_auction_customs_entries_on_trade_id", using: :btree

  create_table "auction_deliveries", force: :cascade do |t|
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "service",      limit: 255
    t.string   "identifier",   limit: 255
    t.text     "content",      limit: 65535
    t.string   "status",       limit: 255
    t.integer  "lock_version", limit: 4,     default: 0
  end

  create_table "auction_events", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "amount",       limit: 4
    t.integer  "limitation",   limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "active",                     default: true,  null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "price",        limit: 4
    t.boolean  "published",                  default: false, null: false
    t.string   "genre",        limit: 255
  end

  create_table "auction_fanships", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "brand_id",     limit: 4
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4, default: 0
  end

  add_index "auction_fanships", ["user_id", "brand_id"], name: "by_user_id_and_brand_id", using: :btree

  create_table "auction_favorites", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "product_id",   limit: 4
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4, default: 0
  end

  add_index "auction_favorites", ["user_id", "product_id"], name: "by_user_id_and_product_id", using: :btree

  create_table "auction_goods", force: :cascade do |t|
    t.integer  "editor_id",       limit: 4
    t.integer  "item_id",         limit: 4
    t.integer  "trade_id",        limit: 4
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "starting_point",  limit: 4
    t.integer  "reserve_point",   limit: 4
    t.integer  "ascending_point", limit: 4
    t.integer  "bidding_point",   limit: 4
    t.boolean  "published",                     default: false, null: false
    t.boolean  "active",                        default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",    limit: 4,     default: 0
    t.integer  "current_point",   limit: 4,     default: 0
    t.string   "swf",             limit: 255
  end

  add_index "auction_goods", ["active", "ended_at"], name: "index_auction_goods_on_active_and_ended_at", using: :btree

  create_table "auction_goods_20101210", force: :cascade do |t|
    t.integer  "editor_id",       limit: 4
    t.integer  "item_id",         limit: 4
    t.integer  "trade_id",        limit: 4
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "starting_point",  limit: 4
    t.integer  "reserve_point",   limit: 4
    t.integer  "ascending_point", limit: 4
    t.integer  "bidding_point",   limit: 4
    t.boolean  "published",                     default: false
    t.boolean  "active",                        default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",    limit: 4,     default: 0
  end

  add_index "auction_goods_20101210", ["active", "ended_at"], name: "index_auction_goods_on_active_and_ended_at", using: :btree

  create_table "auction_goods_20110303", force: :cascade do |t|
    t.integer  "editor_id",       limit: 4
    t.integer  "item_id",         limit: 4
    t.integer  "trade_id",        limit: 4
    t.string   "name",            limit: 255
    t.text     "description",     limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "starting_point",  limit: 4
    t.integer  "reserve_point",   limit: 4
    t.integer  "ascending_point", limit: 4
    t.integer  "bidding_point",   limit: 4
    t.boolean  "published",                     default: false
    t.boolean  "active",                        default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",    limit: 4,     default: 0
    t.integer  "current_point",   limit: 4,     default: 0
    t.string   "swf",             limit: 255
  end

  add_index "auction_goods_20110303", ["active", "ended_at"], name: "index_auction_goods_on_active_and_ended_at", using: :btree

  create_table "auction_guesses", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "product_id",   limit: 4
    t.integer  "price",        limit: 4
    t.integer  "editor_id",    limit: 4
    t.boolean  "published",                default: false, null: false
    t.boolean  "active",                   default: true,  null: false
    t.integer  "lock_version", limit: 4,   default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lowest_price", limit: 4
    t.integer  "dicker_price", limit: 4
  end

  create_table "auction_guesses_chances", force: :cascade do |t|
    t.integer  "guess_id",             limit: 4
    t.integer  "user_id",              limit: 4
    t.integer  "price",                limit: 4
    t.string   "price_history",        limit: 255
    t.integer  "lock_version",         limit: 4,     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "dicker_price_history", limit: 65535
  end

  add_index "auction_guesses_chances", ["user_id", "guess_id"], name: "by_user_id_and_guess_id", using: :btree

  create_table "auction_hits", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "product_id",   limit: 4
    t.integer  "times",        limit: 4, default: 0,    null: false
    t.boolean  "active",                 default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4, default: 0
  end

  add_index "auction_hits", ["user_id", "product_id"], name: "by_user_id_and_product_id", using: :btree

  create_table "auction_images", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "product_id",   limit: 4
    t.string   "large",        limit: 255
    t.string   "medium",       limit: 255
    t.string   "small",        limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,     default: 0
    t.text     "description",  limit: 65535
    t.string   "full",         limit: 255
    t.integer  "sequence",     limit: 4
  end

  add_index "auction_images", ["active", "product_id"], name: "by_active_and_product_id", using: :btree

  create_table "auction_images_20101210", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "product_id",   limit: 4
    t.string   "large",        limit: 255
    t.string   "medium",       limit: 255
    t.string   "small",        limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_images_20110303", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "product_id",   limit: 4
    t.string   "large",        limit: 255
    t.string   "medium",       limit: 255
    t.string   "small",        limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,     default: 0
    t.text     "description",  limit: 65535
    t.string   "full",         limit: 255
  end

  create_table "auction_items", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.integer  "product_id",       limit: 4
    t.boolean  "active",                                               default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "measure",          limit: 255
    t.string   "identifer",        limit: 255
    t.integer  "trade_id",         limit: 4
    t.integer  "lock_version",     limit: 4,                           default: 0
    t.boolean  "published",                                            default: false, null: false
    t.string   "remark",           limit: 255
    t.string   "original_measure", limit: 255
    t.integer  "purchase_type",    limit: 4
    t.datetime "storage_at"
    t.datetime "expired_at"
    t.string   "factory_measure",  limit: 255
    t.string   "standard_measure", limit: 255
    t.string   "origin",           limit: 255
    t.string   "storage_name",     limit: 255
    t.string   "store_num",        limit: 255
    t.decimal  "cost_price",                   precision: 8, scale: 2, default: 0.0
    t.string   "barcode",          limit: 255
  end

  add_index "auction_items", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_items", ["active", "product_id"], name: "index_auction_items_on_active_and_product_id", using: :btree
  add_index "auction_items", ["active", "published", "product_id", "measure"], name: "by_active_and_published_and_product_id_and_measure", using: :btree
  add_index "auction_items", ["identifer"], name: "index_auction_items_on_identifer", using: :btree

  create_table "auction_items_20101210", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "product_id",   limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expired_at"
    t.string   "measure",      limit: 255
    t.string   "identifer",    limit: 255
    t.integer  "trade_id",     limit: 4
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_items_20110303", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "product_id",   limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "expired_at"
    t.string   "measure",      limit: 255
    t.string   "identifer",    limit: 255
    t.integer  "trade_id",     limit: 4
    t.integer  "lock_version", limit: 4,   default: 0
    t.boolean  "published",                default: false, null: false
  end

  add_index "auction_items_20110303", ["active", "product_id"], name: "index_auction_items_on_active_and_product_id", using: :btree

  create_table "auction_items_updatings", force: :cascade do |t|
    t.integer  "item_id",      limit: 4
    t.integer  "editor_id",    limit: 4
    t.boolean  "published"
    t.integer  "lock_version", limit: 4, default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_items_updatings", ["item_id", "created_at"], name: "by_item_id_and_created_at", using: :btree

  create_table "auction_levels", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.string   "icon",         limit: 255
    t.integer  "limitation",   limit: 4
    t.integer  "percent",      limit: 4
    t.string   "mall_ids",     limit: 255
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "reservation",  limit: 4
  end

  create_table "auction_links", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "url",          limit: 255
    t.string   "source",       limit: 255
    t.string   "identifier",   limit: 255
    t.integer  "price",        limit: 4
    t.boolean  "active",                     default: true, null: false
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "ad_id",        limit: 4
    t.integer  "lock_version", limit: 4,     default: 0
  end

  add_index "auction_links", ["active", "id"], name: "by_active_and_id", using: :btree

  create_table "auction_locations", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "pic",          limit: 255
    t.string   "description",  limit: 255
    t.string   "remark",       limit: 255
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                   default: true,  null: false
    t.boolean  "published",                default: false, null: false
    t.integer  "lock_version", limit: 4,   default: 0,     null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "auction_lotteries", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "market_id",    limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "limitation",   limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "published",                  default: false, null: false
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buying_point", limit: 4
    t.integer  "lock_version", limit: 4,     default: 0
  end

  add_index "auction_lotteries", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_lotteries", ["active", "published", "created_at"], name: "by_active_and_published_and_created_at", using: :btree

  create_table "auction_lotteries_20101210", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "market_id",    limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "limitation",   limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "published",                  default: false
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_lotteries_20101210", ["active", "ended_at"], name: "index_auction_lotteries_on_active_and_ended_at", using: :btree

  create_table "auction_lotteries_20110303", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "market_id",    limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "limitation",   limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "published",                  default: false
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "buying_point", limit: 4
  end

  add_index "auction_lotteries_20110303", ["active", "ended_at"], name: "index_auction_lotteries_on_active_and_ended_at", using: :btree

  create_table "auction_mailings", force: :cascade do |t|
    t.integer  "mail_id",      limit: 4
    t.integer  "account_id",   limit: 4
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4, default: 0
  end

  add_index "auction_mailings", ["mail_id", "account_id"], name: "index_auction_mailings_on_mail_id_and_account_id", unique: true, using: :btree

  create_table "auction_mails", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "title",        limit: 255
    t.text     "content",      limit: 4294967295
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "send_time"
    t.boolean  "active",                          default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "prefix",                          default: false, null: false
    t.boolean  "published",                       default: false, null: false
    t.integer  "lock_version", limit: 4,          default: 0
    t.string   "promotion",    limit: 255
    t.string   "engine",       limit: 255
  end

  add_index "auction_mails", ["active", "id"], name: "by_active_and_id", using: :btree

  create_table "auction_mails_20101210", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "title",        limit: 255
    t.text     "content",      limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.datetime "send_time"
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_mails_updatings", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 4294967295
    t.integer  "editor_id",  limit: 4
    t.integer  "mail_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_malls", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "name",         limit: 255
    t.boolean  "active",                     default: true,  null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description",  limit: 65535
    t.string   "pic",          limit: 255
    t.integer  "order",        limit: 4
    t.integer  "percent",      limit: 4
    t.boolean  "published",                  default: false, null: false
    t.string   "rule",         limit: 255
    t.string   "detail",       limit: 255
    t.string   "genre",        limit: 255
  end

  create_table "auction_markets", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "swf",          limit: 255
    t.string   "fla",          limit: 255
    t.boolean  "published",                  default: false, null: false
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic",          limit: 255
    t.string   "identifier",   limit: 255
    t.integer  "lock_version", limit: 4,     default: 0
    t.string   "recommend",    limit: 255
    t.string   "large_pic",    limit: 255
    t.string   "list_pic",     limit: 255
    t.string   "bg_pic",       limit: 255
    t.string   "bg_color",     limit: 255
    t.string   "link",         limit: 255
  end

  add_index "auction_markets", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_markets", ["active", "published", "created_at"], name: "by_active_and_published_and_created_at", using: :btree

  create_table "auction_markets_20101210", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "swf",          limit: 255
    t.string   "fla",          limit: 255
    t.boolean  "published",                  default: false
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic",          limit: 255
    t.string   "identifier",   limit: 255
    t.integer  "lock_version", limit: 4,     default: 0
  end

  create_table "auction_markets_20110303", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "swf",          limit: 255
    t.string   "fla",          limit: 255
    t.boolean  "published",                  default: false
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic",          limit: 255
    t.string   "identifier",   limit: 255
    t.integer  "lock_version", limit: 4,     default: 0
  end

  create_table "auction_messages", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "operation",    limit: 255
    t.integer  "target_id",    limit: 4
    t.boolean  "processed",                default: false, null: false
    t.integer  "lock_version", limit: 4,   default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_multibuys", force: :cascade do |t|
    t.integer  "editor_id",                  limit: 4
    t.string   "name",                       limit: 255
    t.text     "description",                limit: 65535
    t.string   "pic",                        limit: 255
    t.string   "rule",                       limit: 255
    t.string   "detail",                     limit: 255
    t.integer  "percent_for_2",              limit: 4
    t.integer  "percent_for_3",              limit: 4
    t.integer  "percent_for_4",              limit: 4
    t.boolean  "active",                                   default: true,  null: false
    t.boolean  "published",                                default: false, null: false
    t.integer  "lock_version",               limit: 4,     default: 0,     null: false
    t.datetime "created_at",                                               null: false
    t.datetime "updated_at",                                               null: false
    t.string   "pic_file_name",              limit: 255
    t.integer  "pic_file_size",              limit: 4
    t.string   "pic_content_type",           limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",            limit: 4
    t.integer  "pic_image_height",           limit: 4
    t.string   "rule_file_name",             limit: 255
    t.integer  "rule_file_size",             limit: 4
    t.string   "rule_content_type",          limit: 255
    t.datetime "rule_updated_at"
    t.integer  "rule_image_width",           limit: 4
    t.integer  "rule_image_height",          limit: 4
    t.string   "detail_file_name",           limit: 255
    t.integer  "detail_file_size",           limit: 4
    t.string   "detail_content_type",        limit: 255
    t.datetime "detail_updated_at"
    t.integer  "detail_image_width",         limit: 4
    t.integer  "detail_image_height",        limit: 4
    t.string   "pic_for_phone",              limit: 255
    t.string   "pic_for_phone_file_name",    limit: 255
    t.integer  "pic_for_phone_file_size",    limit: 4
    t.string   "pic_for_phone_content_type", limit: 255
    t.datetime "pic_for_phone_updated_at"
    t.integer  "pic_for_phone_image_width",  limit: 4
    t.integer  "pic_for_phone_image_height", limit: 4
    t.string   "pic_for_pad",                limit: 255
    t.string   "pic_for_pad_file_name",      limit: 255
    t.integer  "pic_for_pad_file_size",      limit: 4
    t.string   "pic_for_pad_content_type",   limit: 255
    t.datetime "pic_for_pad_updated_at"
    t.integer  "pic_for_pad_image_width",    limit: 4
    t.integer  "pic_for_pad_image_height",   limit: 4
  end

  create_table "auction_notifications", force: :cascade do |t|
    t.integer  "product_id",   limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "email",        limit: 255
    t.string   "mobile",       limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,     default: 0
    t.string   "measure",      limit: 255
    t.boolean  "notified",                   default: false, null: false
    t.text     "remark",       limit: 65535
    t.text     "comment",      limit: 65535
    t.integer  "brand_id",     limit: 4
    t.integer  "category1_id", limit: 4
    t.integer  "category2_id", limit: 4
    t.datetime "notified_at"
    t.integer  "quantity",     limit: 4,     default: 1
    t.integer  "handler_id",   limit: 4
    t.datetime "handled_at"
  end

  create_table "auction_operators", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "person_id",    limit: 4
    t.string   "service",      limit: 255
    t.boolean  "online"
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,   default: 0
    t.string   "identifier",   limit: 255
  end

  add_index "auction_operators", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_operators", ["active", "online", "service"], name: "by_active_and_online_and_service", using: :btree

  create_table "auction_packages", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "product_id",   limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.string   "pic",          limit: 255
    t.integer  "order",        limit: 4,     default: 1
    t.boolean  "active",                     default: true,  null: false
    t.boolean  "published",                  default: false, null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_pages", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "position",              limit: 255
    t.string   "engine",                limit: 255
    t.text     "content",               limit: 65535
    t.integer  "editor_id",             limit: 4
    t.boolean  "published",                           default: false, null: false
    t.boolean  "active",                              default: true,  null: false
    t.integer  "lock_version",          limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title",                 limit: 255
    t.string   "series",                limit: 255
    t.string   "snapshot",              limit: 255
    t.string   "snapshot_file_name",    limit: 255
    t.integer  "snapshot_file_size",    limit: 4
    t.string   "snapshot_content_type", limit: 255
    t.datetime "snapshot_updated_at"
    t.integer  "snapshot_image_width",  limit: 4
    t.integer  "snapshot_image_height", limit: 4
    t.string   "keywords",              limit: 255
    t.string   "description",           limit: 255
  end

  add_index "auction_pages", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_pages", ["active", "published", "position", "id"], name: "by_active_and_published_and_position_and_id", using: :btree

  create_table "auction_pages_images", force: :cascade do |t|
    t.integer  "page_id",          limit: 4
    t.string   "pic",              limit: 255
    t.string   "pic_file_name",    limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.string   "pic_content_type", limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
    t.boolean  "active",                       default: true, null: false
    t.integer  "lock_version",     limit: 4,   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_pages_images", ["active", "page_id"], name: "index_auction_pages_images_on_active_and_page_id", using: :btree

  create_table "auction_pages_pages", force: :cascade do |t|
    t.integer  "page_id",      limit: 4
    t.integer  "child_id",     limit: 4
    t.boolean  "active",                 default: true, null: false
    t.integer  "lock_version", limit: 4, default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_pages_pages", ["active", "page_id", "child_id"], name: "by_active_and_page_id_and_child_id", using: :btree

  create_table "auction_pats", force: :cascade do |t|
    t.integer  "editor_id",        limit: 4
    t.string   "name",             limit: 255
    t.string   "pic",              limit: 255
    t.integer  "pic_width",        limit: 4
    t.string   "gender",           limit: 255
    t.string   "genre",            limit: 255
    t.boolean  "active",                       default: true,  null: false
    t.boolean  "published",                    default: false, null: false
    t.integer  "lock_version",     limit: 4,   default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "source",           limit: 255
    t.string   "pic_file_name",    limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.string   "pic_content_type", limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
    t.string   "species",          limit: 255
    t.datetime "arrived_at"
    t.boolean  "support_ipad",                 default: false, null: false
    t.boolean  "support_pc",                   default: false, null: false
  end

  create_table "auction_pats_hotspots", force: :cascade do |t|
    t.integer  "pat_id",       limit: 4
    t.integer  "editor_id",    limit: 4
    t.integer  "product_id",   limit: 4
    t.integer  "left",         limit: 4
    t.integer  "top",          limit: 4
    t.integer  "order",        limit: 4
    t.boolean  "active",                 default: true, null: false
    t.integer  "lock_version", limit: 4, default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_pats_hotspots", ["active", "pat_id"], name: "by_active_and_pat_id", using: :btree

  create_table "auction_payments", force: :cascade do |t|
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4, default: 0
  end

  create_table "auction_pictures", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "mail_id",      limit: 4
    t.string   "path",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_pictures_20101210", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "mail_id",      limit: 4
    t.string   "path",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_preferences", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.integer  "bust",         limit: 4
    t.integer  "waistline",    limit: 4
    t.integer  "hip",          limit: 4
    t.integer  "shoulder",     limit: 4
    t.integer  "arm",          limit: 4
    t.integer  "leg",          limit: 4
    t.boolean  "active",                   default: true, null: false
    t.integer  "lock_version", limit: 4,   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "gender",       limit: 255
  end

  add_index "auction_preferences", ["active", "user_id", "updated_at"], name: "by_active_and_user_id_and_updated_at", using: :btree

  create_table "auction_product_operation_images", force: :cascade do |t|
    t.string   "pic",              limit: 255
    t.string   "pic_file_name",    limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.string   "pic_content_type", limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
    t.integer  "sequence",         limit: 4
    t.integer  "product_id",       limit: 4
    t.boolean  "active",                       default: true, null: false
    t.integer  "lock_version",     limit: 4,   default: 0,    null: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "auction_productions", force: :cascade do |t|
    t.integer  "user_id",                  limit: 4
    t.string   "name",                     limit: 255
    t.text     "description",              limit: 65535
    t.string   "pic",                      limit: 255
    t.decimal  "price",                                  precision: 10
    t.decimal  "discount",                               precision: 10
    t.boolean  "published",                                             default: false, null: false
    t.boolean  "active",                                                default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cart_pic",                 limit: 255
    t.string   "spec_pic",                 limit: 255
    t.string   "color_pic",                limit: 255
    t.string   "color_name",               limit: 255
    t.string   "identifier",               limit: 255
    t.string   "keywords",                 limit: 255
    t.string   "brand_link",               limit: 255
    t.text     "brand_description",        limit: 65535
    t.text     "material",                 limit: 65535
    t.integer  "percent",                  limit: 4
    t.integer  "image_id",                 limit: 4
    t.integer  "market_id",                limit: 4
    t.integer  "category_id",              limit: 4
    t.string   "relate_product_ids",       limit: 255
    t.boolean  "rec",                                                   default: false
    t.string   "rec_pic",                  limit: 255
    t.integer  "order",                    limit: 4,                    default: 1
    t.string   "percent_text",             limit: 255
    t.text     "accelerator",              limit: 65535
    t.string   "styles",                   limit: 255
    t.integer  "lock_version",             limit: 4,                    default: 0
    t.integer  "sell_duration",            limit: 4
    t.integer  "sell_total",               limit: 4
    t.integer  "point",                    limit: 4,                    default: 0,     null: false
    t.integer  "video_id",                 limit: 4
    t.integer  "category1_id",             limit: 4
    t.integer  "category2_id",             limit: 4
    t.integer  "brand_id",                 limit: 4
    t.text     "attribute_data",           limit: 65535
    t.integer  "promotion_price",          limit: 4
    t.datetime "promotion_started_at"
    t.datetime "promotion_ended_at"
    t.datetime "published_at"
    t.string   "color",                    limit: 255
    t.string   "recommend",                limit: 255
    t.string   "target",                   limit: 255
    t.string   "match_pic",                limit: 255
    t.text     "match_product_ids",        limit: 65535
    t.string   "major_pic",                limit: 255
    t.integer  "sell_current",             limit: 4
    t.integer  "unsold_count",             limit: 4
    t.string   "measures_unsold_count",    limit: 255
    t.string   "remark",                   limit: 255
    t.string   "label",                    limit: 255
    t.string   "prefix",                   limit: 255
    t.text     "discount_history",         limit: 65535
    t.integer  "scarcity",                 limit: 4,                    default: 0,     null: false
    t.integer  "readings_count",           limit: 4,                    default: 0,     null: false
    t.text     "measure_table",            limit: 65535
    t.integer  "mall_id",                  limit: 4
    t.string   "fitting_pic",              limit: 255
    t.datetime "hourglass_started_at"
    t.integer  "hourglass_rate",           limit: 4
    t.integer  "hourglass_pause_duration", limit: 4
  end

  add_index "auction_productions", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_productions", ["active", "published", "brand_id", "published_at"], name: "by_active_and_published_and_brand_id_and_published_at", using: :btree
  add_index "auction_productions", ["active", "published", "category1_id", "published_at"], name: "by_active_and_published_and_category1_id_and_published_at", using: :btree
  add_index "auction_productions", ["active", "published", "category2_id", "published_at"], name: "by_active_and_published_and_category2_id_and_published_at", using: :btree
  add_index "auction_productions", ["active", "published", "color", "published_at"], name: "by_active_and_published_and_color_and_published_at", using: :btree
  add_index "auction_productions", ["active", "published", "mall_id", "target", "published_at"], name: "by_active_and_published_and_mall_id_and_target_and_published_at", using: :btree
  add_index "auction_productions", ["active", "published", "price", "published_at"], name: "by_active_and_published_and_price_and_published_at", using: :btree
  add_index "auction_productions", ["active", "published", "published_at"], name: "by_active_and_published_and_published_at", using: :btree
  add_index "auction_productions", ["active", "published", "recommend", "published_at"], name: "by_active_and_published_and_recommend_and_published_at", using: :btree
  add_index "auction_productions", ["active", "published", "target", "published_at"], name: "by_active_and_published_and_target_and_published_at", using: :btree
  add_index "auction_productions", ["brand_id", "target", "unsold_count"], name: "by_brand_id_and_target_and_unsold_count", using: :btree

  create_table "auction_productions_copy", force: :cascade do |t|
    t.integer  "user_id",                  limit: 4
    t.string   "name",                     limit: 255
    t.text     "description",              limit: 65535
    t.string   "pic",                      limit: 255
    t.decimal  "price",                                  precision: 10
    t.decimal  "discount",                               precision: 10
    t.boolean  "published",                                             default: false, null: false
    t.boolean  "active",                                                default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cart_pic",                 limit: 255
    t.string   "spec_pic",                 limit: 255
    t.string   "color_pic",                limit: 255
    t.string   "color_name",               limit: 255
    t.string   "identifier",               limit: 255
    t.string   "keywords",                 limit: 255
    t.string   "brand_link",               limit: 255
    t.text     "brand_description",        limit: 65535
    t.text     "material",                 limit: 65535
    t.integer  "percent",                  limit: 4
    t.integer  "image_id",                 limit: 4
    t.integer  "market_id",                limit: 4
    t.integer  "category_id",              limit: 4
    t.string   "relate_product_ids",       limit: 255
    t.boolean  "rec",                                                   default: false
    t.string   "rec_pic",                  limit: 255
    t.integer  "order",                    limit: 4,                    default: 1
    t.string   "percent_text",             limit: 255
    t.text     "accelerator",              limit: 65535
    t.string   "styles",                   limit: 255
    t.integer  "lock_version",             limit: 4,                    default: 0
    t.integer  "sell_duration",            limit: 4
    t.integer  "sell_total",               limit: 4
    t.integer  "point",                    limit: 4,                    default: 0,     null: false
    t.integer  "video_id",                 limit: 4
    t.integer  "category1_id",             limit: 4
    t.integer  "category2_id",             limit: 4
    t.integer  "brand_id",                 limit: 4
    t.text     "attribute_data",           limit: 65535
    t.integer  "promotion_price",          limit: 4
    t.datetime "promotion_started_at"
    t.datetime "promotion_ended_at"
    t.datetime "published_at"
    t.string   "color",                    limit: 255
    t.string   "recommend",                limit: 255
    t.string   "target",                   limit: 255
    t.string   "match_pic",                limit: 255
    t.text     "match_product_ids",        limit: 65535
    t.string   "major_pic",                limit: 255
    t.integer  "sell_current",             limit: 4
    t.integer  "unsold_count",             limit: 4
    t.string   "measures_unsold_count",    limit: 255
    t.string   "remark",                   limit: 255
    t.string   "label",                    limit: 255
    t.string   "prefix",                   limit: 255
    t.text     "discount_history",         limit: 65535
    t.integer  "scarcity",                 limit: 4,                    default: 0,     null: false
    t.integer  "readings_count",           limit: 4,                    default: 0,     null: false
    t.text     "measure_table",            limit: 65535
    t.integer  "mall_id",                  limit: 4
    t.string   "fitting_pic",              limit: 255
    t.datetime "hourglass_started_at"
    t.integer  "hourglass_rate",           limit: 4
    t.integer  "hourglass_pause_duration", limit: 4
  end

  add_index "auction_productions_copy", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_productions_copy", ["active", "published", "brand_id", "published_at"], name: "by_active_and_published_and_brand_id_and_published_at", using: :btree
  add_index "auction_productions_copy", ["active", "published", "category1_id", "published_at"], name: "by_active_and_published_and_category1_id_and_published_at", using: :btree
  add_index "auction_productions_copy", ["active", "published", "category2_id", "published_at"], name: "by_active_and_published_and_category2_id_and_published_at", using: :btree
  add_index "auction_productions_copy", ["active", "published", "color", "published_at"], name: "by_active_and_published_and_color_and_published_at", using: :btree
  add_index "auction_productions_copy", ["active", "published", "mall_id", "target", "published_at"], name: "by_active_and_published_and_mall_id_and_target_and_published_at", using: :btree
  add_index "auction_productions_copy", ["active", "published", "price", "published_at"], name: "by_active_and_published_and_price_and_published_at", using: :btree
  add_index "auction_productions_copy", ["active", "published", "published_at"], name: "by_active_and_published_and_published_at", using: :btree
  add_index "auction_productions_copy", ["active", "published", "recommend", "published_at"], name: "by_active_and_published_and_recommend_and_published_at", using: :btree
  add_index "auction_productions_copy", ["active", "published", "target", "published_at"], name: "by_active_and_published_and_target_and_published_at", using: :btree
  add_index "auction_productions_copy", ["brand_id", "target", "unsold_count"], name: "by_brand_id_and_target_and_unsold_count", using: :btree

  create_table "auction_products", force: :cascade do |t|
    t.integer  "user_id",                     limit: 4
    t.string   "name",                        limit: 255
    t.text     "description",                 limit: 65535
    t.string   "pic",                         limit: 255
    t.decimal  "price",                                          precision: 10
    t.decimal  "discount",                                       precision: 10
    t.boolean  "published",                                                               default: false, null: false
    t.boolean  "active",                                                                  default: true
    t.datetime "destroyed_at"
    t.datetime "arrived_at"
    t.datetime "updated_at"
    t.string   "cart_pic",                    limit: 255
    t.string   "spec_pic",                    limit: 255
    t.string   "color_pic",                   limit: 255
    t.string   "color_name",                  limit: 255
    t.string   "identifier",                  limit: 255
    t.string   "keywords",                    limit: 255
    t.string   "brand_link",                  limit: 255
    t.text     "brand_description",           limit: 65535
    t.text     "material",                    limit: 65535
    t.integer  "percent",                     limit: 4
    t.integer  "image_id",                    limit: 4
    t.integer  "market_id",                   limit: 4
    t.integer  "category_id",                 limit: 4
    t.string   "relate_product_ids",          limit: 255
    t.boolean  "rec",                                                                     default: false
    t.string   "rec_pic",                     limit: 255
    t.integer  "order",                       limit: 4,                                   default: 1
    t.string   "percent_text",                limit: 255
    t.text     "accelerator",                 limit: 65535
    t.string   "styles",                      limit: 255
    t.integer  "lock_version",                limit: 4,                                   default: 0
    t.integer  "sell_duration",               limit: 4
    t.integer  "sell_total",                  limit: 4
    t.integer  "point",                       limit: 4,                                   default: 0,     null: false
    t.integer  "video_id",                    limit: 4
    t.integer  "category1_id",                limit: 4
    t.integer  "category2_id",                limit: 4
    t.integer  "brand_id",                    limit: 4
    t.text     "attribute_data",              limit: 65535
    t.integer  "promotion_price",             limit: 4
    t.datetime "promotion_started_at"
    t.datetime "promotion_ended_at"
    t.datetime "published_at"
    t.string   "color",                       limit: 255
    t.string   "recommend",                   limit: 255
    t.string   "target",                      limit: 255
    t.string   "match_pic",                   limit: 255
    t.text     "match_product_ids",           limit: 65535
    t.string   "major_pic",                   limit: 255
    t.integer  "sold_count",                  limit: 4
    t.integer  "unsold_count",                limit: 4
    t.string   "measures_unsold_count",       limit: 255
    t.string   "remark",                      limit: 255
    t.string   "label",                       limit: 255
    t.string   "prefix",                      limit: 255
    t.text     "discount_history",            limit: 65535
    t.integer  "scarcity",                    limit: 4,                                   default: 0,     null: false
    t.integer  "readings_count",              limit: 4,                                   default: 0,     null: false
    t.text     "measure_table",               limit: 65535
    t.integer  "mall_id",                     limit: 4
    t.string   "fitting_pic",                 limit: 255
    t.datetime "hourglass_started_at"
    t.integer  "hourglass_rate",              limit: 4
    t.integer  "hourglass_pause_duration",    limit: 4
    t.datetime "hourglass_trade_created_at"
    t.integer  "hourglass_trade_price",       limit: 4
    t.integer  "original_price",              limit: 4
    t.string   "measure_description",         limit: 255
    t.datetime "created_at"
    t.datetime "edited_at"
    t.integer  "zoom",                        limit: 4
    t.integer  "sell_current",                limit: 4
    t.string   "measure_style",               limit: 255
    t.string   "storage_location",            limit: 255
    t.text     "measure_suggestion",          limit: 65535
    t.integer  "items_count",                 limit: 4
    t.integer  "items_unpublished_count",     limit: 4
    t.integer  "items_unsold_count",          limit: 4
    t.string   "origins",                     limit: 255
    t.string   "background",                  limit: 255
    t.text     "extra_description",           limit: 65535
    t.string   "extra_pic",                   limit: 255
    t.string   "happy",                       limit: 255
    t.string   "name_backup",                 limit: 255
    t.string   "model_pic",                   limit: 255
    t.integer  "minimum_price",               limit: 4
    t.string   "detail_pic",                  limit: 255
    t.integer  "category3_id",                limit: 4
    t.string   "download_pic",                limit: 255
    t.string   "thickness",                   limit: 255
    t.string   "elasticity",                  limit: 255
    t.string   "pliability",                  limit: 255
    t.integer  "multibuy_id",                 limit: 4
    t.integer  "shop_price",                  limit: 4
    t.string   "remark2",                     limit: 255
    t.integer  "u_upper_limit",               limit: 4
    t.integer  "u_lower_limit",               limit: 4
    t.text     "special_product_mention",     limit: 65535
    t.string   "texture",                     limit: 255
    t.integer  "location_id",                 limit: 4,                                   default: 1
    t.decimal  "tax_rate",                                       precision: 10, scale: 4
    t.string   "wtd_identifier",              limit: 255
    t.boolean  "foreign_payment",                                                         default: false
    t.text     "description2",                limit: 4294967295
    t.string   "special_product_mention_pic", limit: 255
    t.boolean  "operation_images_published",                                              default: true
    t.integer  "use_times",                   limit: 4
    t.text     "batch_remark",                limit: 65535
  end

  add_index "auction_products", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_products", ["active", "published", "brand_id", "published_at"], name: "by_active_and_published_and_brand_id_and_published_at", using: :btree
  add_index "auction_products", ["active", "published", "category1_id", "published_at"], name: "by_active_and_published_and_category1_id_and_published_at", using: :btree
  add_index "auction_products", ["active", "published", "category2_id", "published_at"], name: "by_active_and_published_and_category2_id_and_published_at", using: :btree
  add_index "auction_products", ["active", "published", "color", "published_at"], name: "by_active_and_published_and_color_and_published_at", using: :btree
  add_index "auction_products", ["active", "published", "mall_id", "target", "published_at"], name: "by_active_and_published_and_mall_id_and_target_and_published_at", using: :btree
  add_index "auction_products", ["active", "published", "price", "published_at"], name: "by_active_and_published_and_price_and_published_at", using: :btree
  add_index "auction_products", ["active", "published", "published_at"], name: "by_active_and_published_and_published_at", using: :btree
  add_index "auction_products", ["active", "published", "recommend", "published_at"], name: "by_active_and_published_and_recommend_and_published_at", using: :btree
  add_index "auction_products", ["active", "published", "target", "published_at"], name: "by_active_and_published_and_target_and_published_at", using: :btree
  add_index "auction_products", ["brand_id", "target", "unsold_count"], name: "by_brand_id_and_target_and_unsold_count", using: :btree
  add_index "auction_products", ["location_id"], name: "index_auction_products_on_location_id", using: :btree

  create_table "auction_products_20101210", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.string   "pic",                limit: 255
    t.decimal  "price",                            precision: 10
    t.decimal  "discount",                         precision: 10
    t.boolean  "published"
    t.boolean  "active",                                          default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cart_pic",           limit: 255
    t.string   "spec_pic",           limit: 255
    t.string   "color_pic",          limit: 255
    t.string   "color_name",         limit: 255
    t.string   "identifier",         limit: 255
    t.string   "keywords",           limit: 255
    t.string   "brand_link",         limit: 255
    t.text     "brand_description",  limit: 65535
    t.text     "material",           limit: 65535
    t.integer  "percent",            limit: 4
    t.integer  "image_id",           limit: 4
    t.integer  "market_id",          limit: 4
    t.integer  "category_id",        limit: 4
    t.string   "relate_product_ids", limit: 255
    t.boolean  "rec",                                             default: false
    t.string   "rec_pic",            limit: 255
    t.integer  "order",              limit: 4,                    default: 1
    t.string   "percent_text",       limit: 255
    t.text     "accelerator",        limit: 65535
    t.string   "styles",             limit: 255
    t.integer  "lock_version",       limit: 4,                    default: 0
  end

  create_table "auction_products_20110303", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.string   "name",                 limit: 255
    t.text     "description",          limit: 65535
    t.string   "pic",                  limit: 255
    t.decimal  "price",                              precision: 10
    t.decimal  "discount",                           precision: 10
    t.boolean  "published"
    t.boolean  "active",                                            default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cart_pic",             limit: 255
    t.string   "spec_pic",             limit: 255
    t.string   "color_pic",            limit: 255
    t.string   "color_name",           limit: 255
    t.string   "identifier",           limit: 255
    t.string   "keywords",             limit: 255
    t.string   "brand_link",           limit: 255
    t.text     "brand_description",    limit: 65535
    t.text     "material",             limit: 65535
    t.integer  "percent",              limit: 4
    t.integer  "image_id",             limit: 4
    t.integer  "market_id",            limit: 4
    t.integer  "category_id",          limit: 4
    t.string   "relate_product_ids",   limit: 255
    t.boolean  "rec",                                               default: false
    t.string   "rec_pic",              limit: 255
    t.integer  "order",                limit: 4,                    default: 1
    t.string   "percent_text",         limit: 255
    t.text     "accelerator",          limit: 65535
    t.string   "styles",               limit: 255
    t.integer  "lock_version",         limit: 4,                    default: 0
    t.integer  "sell_duration",        limit: 4
    t.integer  "sell_total",           limit: 4
    t.integer  "point",                limit: 4
    t.integer  "video_id",             limit: 4
    t.integer  "category1_id",         limit: 4
    t.integer  "category2_id",         limit: 4
    t.integer  "brand_id",             limit: 4
    t.text     "attribute_data",       limit: 65535
    t.integer  "promotion_price",      limit: 4
    t.datetime "promotion_started_at"
    t.datetime "promotion_ended_at"
    t.datetime "published_at"
    t.string   "color",                limit: 255
    t.string   "recommend",            limit: 255
    t.string   "target",               limit: 255
    t.string   "match_pic",            limit: 255
    t.text     "match_product_ids",    limit: 65535
    t.string   "major_pic",            limit: 255
  end

  add_index "auction_products_20110303", ["active", "published", "market_id"], name: "index_auction_products_on_active_and_published_and_market_id", using: :btree

  create_table "auction_products_20111201", force: :cascade do |t|
    t.integer  "user_id",                  limit: 4
    t.string   "name",                     limit: 255
    t.text     "description",              limit: 65535
    t.string   "pic",                      limit: 255
    t.decimal  "price",                                  precision: 10
    t.decimal  "discount",                               precision: 10
    t.boolean  "published",                                             default: false, null: false
    t.boolean  "active",                                                default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cart_pic",                 limit: 255
    t.string   "spec_pic",                 limit: 255
    t.string   "color_pic",                limit: 255
    t.string   "color_name",               limit: 255
    t.string   "identifier",               limit: 255
    t.string   "keywords",                 limit: 255
    t.string   "brand_link",               limit: 255
    t.text     "brand_description",        limit: 65535
    t.text     "material",                 limit: 65535
    t.integer  "percent",                  limit: 4
    t.integer  "image_id",                 limit: 4
    t.integer  "market_id",                limit: 4
    t.integer  "category_id",              limit: 4
    t.string   "relate_product_ids",       limit: 255
    t.boolean  "rec",                                                   default: false
    t.string   "rec_pic",                  limit: 255
    t.integer  "order",                    limit: 4,                    default: 1
    t.string   "percent_text",             limit: 255
    t.text     "accelerator",              limit: 65535
    t.string   "styles",                   limit: 255
    t.integer  "lock_version",             limit: 4,                    default: 0
    t.integer  "sell_duration",            limit: 4
    t.integer  "sell_total",               limit: 4
    t.integer  "point",                    limit: 4,                    default: 0,     null: false
    t.integer  "video_id",                 limit: 4
    t.integer  "category1_id",             limit: 4
    t.integer  "category2_id",             limit: 4
    t.integer  "brand_id",                 limit: 4
    t.text     "attribute_data",           limit: 65535
    t.integer  "promotion_price",          limit: 4
    t.datetime "promotion_started_at"
    t.datetime "promotion_ended_at"
    t.datetime "published_at"
    t.string   "color",                    limit: 255
    t.string   "recommend",                limit: 255
    t.string   "target",                   limit: 255
    t.string   "match_pic",                limit: 255
    t.text     "match_product_ids",        limit: 65535
    t.string   "major_pic",                limit: 255
    t.integer  "sell_current",             limit: 4
    t.integer  "unsold_count",             limit: 4
    t.string   "measures_unsold_count",    limit: 255
    t.string   "remark",                   limit: 255
    t.string   "label",                    limit: 255
    t.string   "prefix",                   limit: 255
    t.text     "discount_history",         limit: 65535
    t.integer  "scarcity",                 limit: 4,                    default: 0,     null: false
    t.integer  "readings_count",           limit: 4,                    default: 0,     null: false
    t.text     "measure_table",            limit: 65535
    t.integer  "mall_id",                  limit: 4
    t.string   "fitting_pic",              limit: 255
    t.datetime "hourglass_started_at"
    t.integer  "hourglass_rate",           limit: 4
    t.integer  "hourglass_pause_duration", limit: 4
  end

  add_index "auction_products_20111201", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_products_20111201", ["active", "published", "brand_id", "published_at"], name: "by_active_and_published_and_brand_id_and_published_at", using: :btree
  add_index "auction_products_20111201", ["active", "published", "category1_id", "published_at"], name: "by_active_and_published_and_category1_id_and_published_at", using: :btree
  add_index "auction_products_20111201", ["active", "published", "category2_id", "published_at"], name: "by_active_and_published_and_category2_id_and_published_at", using: :btree
  add_index "auction_products_20111201", ["active", "published", "color", "published_at"], name: "by_active_and_published_and_color_and_published_at", using: :btree
  add_index "auction_products_20111201", ["active", "published", "mall_id", "target", "published_at"], name: "by_active_and_published_and_mall_id_and_target_and_published_at", using: :btree
  add_index "auction_products_20111201", ["active", "published", "price", "published_at"], name: "by_active_and_published_and_price_and_published_at", using: :btree
  add_index "auction_products_20111201", ["active", "published", "published_at"], name: "by_active_and_published_and_published_at", using: :btree
  add_index "auction_products_20111201", ["active", "published", "recommend", "published_at"], name: "by_active_and_published_and_recommend_and_published_at", using: :btree
  add_index "auction_products_20111201", ["active", "published", "target", "published_at"], name: "by_active_and_published_and_target_and_published_at", using: :btree
  add_index "auction_products_20111201", ["brand_id", "target", "unsold_count"], name: "by_brand_id_and_target_and_unsold_count", using: :btree

  create_table "auction_products_updatings", force: :cascade do |t|
    t.integer  "product_id", limit: 4
    t.integer  "editor_id",  limit: 4
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "published"
  end

  add_index "auction_products_updatings", ["product_id", "created_at"], name: "by_product_id_and_created_at", using: :btree

  create_table "auction_promotions", force: :cascade do |t|
    t.integer  "editor_id",         limit: 4
    t.string   "name",              limit: 255
    t.text     "description",       limit: 65535
    t.boolean  "active",                          default: true,  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",      limit: 4,     default: 0
    t.boolean  "overwrite",                       default: false
    t.string   "icon",              limit: 255
    t.string   "icon_file_name",    limit: 255
    t.string   "icon_content_type", limit: 255
    t.integer  "icon_file_size",    limit: 4
    t.datetime "icon_updated_at"
    t.integer  "icon_image_width",  limit: 4
    t.integer  "icon_image_height", limit: 4
  end

  create_table "auction_provinces", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "country_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.integer  "order",        limit: 4,   default: 1
    t.integer  "lock_version", limit: 4,   default: 0
    t.boolean  "published",                default: false, null: false
  end

  add_index "auction_provinces", ["active", "id"], name: "by_active_and_id", using: :btree

  create_table "auction_provinces_20101210", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "country_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.integer  "order",        limit: 4,   default: 1
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_queues", force: :cascade do |t|
    t.string   "identifier",   limit: 255
    t.string   "name",         limit: 255
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                   default: true, null: false
    t.integer  "lock_version", limit: 4,   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_recommend_images", force: :cascade do |t|
    t.integer  "recommend_id", limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.string   "pic",          limit: 255
    t.string   "url",          limit: 255
    t.integer  "coodinate_x",  limit: 4
    t.integer  "coodinate_y",  limit: 4
    t.integer  "dimension_x",  limit: 4
    t.integer  "dimension_y",  limit: 4
    t.integer  "order",        limit: 4,     default: 1
    t.boolean  "active",                     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "interval",     limit: 4
    t.integer  "lock_version", limit: 4,     default: 0
  end

  create_table "auction_recommends", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "pic",          limit: 255
    t.string   "genre",        limit: 255
    t.string   "title",        limit: 255
    t.string   "discount",     limit: 255
    t.integer  "order",        limit: 4,          default: 1
    t.boolean  "published",                       default: false, null: false
    t.boolean  "active",                          default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,          default: 0
    t.integer  "position",     limit: 4
    t.text     "description",  limit: 65535
    t.string   "url",          limit: 255
    t.integer  "interval",     limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "swf",          limit: 255
    t.text     "xml",          limit: 4294967295
  end

  add_index "auction_recommends", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_recommends", ["active", "published", "created_at"], name: "by_active_and_published_and_created_at", using: :btree

  create_table "auction_recommends_20101210", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "pic",          limit: 255
    t.string   "genre",        limit: 255
    t.string   "title",        limit: 255
    t.string   "discount",     limit: 255
    t.integer  "order",        limit: 4,   default: 1
    t.boolean  "published"
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_recommends_20110303", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "pic",          limit: 255
    t.string   "genre",        limit: 255
    t.string   "title",        limit: 255
    t.string   "discount",     limit: 255
    t.integer  "order",        limit: 4,   default: 1
    t.boolean  "published"
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_shops", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "location",     limit: 255
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                   default: true, null: false
    t.integer  "lock_version", limit: 4,   default: 0,    null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "auction_smss", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "trade_id",     limit: 4
    t.integer  "costumer_id",  limit: 4
    t.string   "phone",        limit: 255
    t.text     "content",      limit: 65535
    t.text     "remark",       limit: 65535
    t.boolean  "active",                     default: true,  null: false
    t.boolean  "success",                    default: false, null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "send_at"
    t.integer  "user_id",      limit: 4
  end

  add_index "auction_smss", ["active", "trade_id"], name: "index_auction_smss_on_active_and_trade_id", using: :btree

  create_table "auction_sorts", force: :cascade do |t|
    t.string   "name",           limit: 255
    t.integer  "parent_id",      limit: 4
    t.integer  "mall_id",        limit: 4
    t.string   "target",         limit: 255
    t.integer  "category1_id",   limit: 4
    t.integer  "category2_id",   limit: 4
    t.integer  "brand_id",       limit: 4
    t.string   "color",          limit: 255
    t.string   "attribute_name", limit: 255
    t.string   "value_content",  limit: 255
    t.string   "order_by",       limit: 255
    t.text     "configuration",  limit: 65535
    t.integer  "editor_id",      limit: 4
    t.boolean  "published",                    default: false, null: false
    t.boolean  "active",                       default: true,  null: false
    t.integer  "lock_version",   limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "auction_stickies", force: :cascade do |t|
    t.integer  "editor_id",          limit: 4
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.integer  "brand_id",           limit: 4
    t.integer  "category1_id",       limit: 4
    t.integer  "category2_id",       limit: 4
    t.string   "target",             limit: 255
    t.text     "product_ids",        limit: 65535
    t.boolean  "active",                           default: true,  null: false
    t.boolean  "published",                        default: false, null: false
    t.integer  "lock_version",       limit: 4,     default: 0,     null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "xml",                limit: 65535
    t.text     "bottom_product_ids", limit: 65535
    t.integer  "category3_id",       limit: 4
  end

  add_index "auction_stickies", ["active", "published", "target", "brand_id", "category1_id", "category2_id"], name: "by_active_and_published_and_target_and_brand_id_and_category1_id", using: :btree

  create_table "auction_stickies_images", force: :cascade do |t|
    t.integer  "sticky_id",        limit: 4
    t.string   "name",             limit: 255
    t.string   "pic",              limit: 255
    t.string   "url",              limit: 255
    t.integer  "sequence",         limit: 4
    t.integer  "dimension_x",      limit: 4
    t.integer  "dimension_y",      limit: 4
    t.string   "pic_file_name",    limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.string   "pic_content_type", limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
    t.boolean  "active",                       default: true, null: false
    t.integer  "lock_version",     limit: 4,   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_stickies_images", ["active", "sticky_id"], name: "index_auction_stickies_images_on_active_and_sticky_id", using: :btree

  create_table "auction_synonyms", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.string   "name",         limit: 255
    t.integer  "brand_id",     limit: 4
    t.integer  "category1_id", limit: 4
    t.integer  "category2_id", limit: 4
    t.string   "target",       limit: 255
    t.string   "color",        limit: 255
    t.boolean  "active",                   default: true, null: false
    t.boolean  "published"
    t.integer  "lock_version", limit: 4,   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "location_id",  limit: 4
  end

  add_index "auction_synonyms", ["active", "published", "name"], name: "by_active_and_published_and_name", using: :btree

  create_table "auction_tickets", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "lottery_id",   limit: 4
    t.integer  "item_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "trade_id",     limit: 4
    t.integer  "bonus_point",  limit: 4
    t.boolean  "published",              default: false, null: false
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4, default: 0
  end

  add_index "auction_tickets", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_tickets", ["active", "published", "lottery_id", "item_id"], name: "by_active_and_published_and_lottery_id_and_item_id", using: :btree
  add_index "auction_tickets", ["active", "published", "lottery_id", "user_id"], name: "by_active_and_published_and_lottery_id_and_user_id", using: :btree

  create_table "auction_tickets_20101210", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "lottery_id",   limit: 4
    t.integer  "item_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "trade_id",     limit: 4
    t.integer  "buying_point", limit: 4
    t.integer  "bonus_point",  limit: 4
    t.boolean  "published",              default: false
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_tickets_20101210", ["active", "lottery_id", "published", "user_id"], name: "index_auction_tickets_on_published_and_lottery_id", using: :btree

  create_table "auction_tickets_20110303", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "lottery_id",   limit: 4
    t.integer  "item_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "trade_id",     limit: 4
    t.integer  "bonus_point",  limit: 4
    t.boolean  "published",              default: false
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_tickets_20110303", ["active", "lottery_id", "published", "user_id"], name: "index_auction_tickets_on_published_and_lottery_id", using: :btree

  create_table "auction_towns", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "city_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.integer  "order",        limit: 4,   default: 1
    t.integer  "lock_version", limit: 4,   default: 0
    t.boolean  "published",                default: false, null: false
    t.string   "postcode",     limit: 255
  end

  add_index "auction_towns", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_towns", ["city_id"], name: "index_auction_towns_on_city_id", using: :btree

  create_table "auction_towns_20101210", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "city_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.integer  "order",        limit: 4,   default: 1
    t.integer  "lock_version", limit: 4,   default: 0
  end

  create_table "auction_trades", force: :cascade do |t|
    t.integer  "user_id",                     limit: 4
    t.integer  "contact_id",                  limit: 4
    t.integer  "payment_id",                  limit: 4
    t.integer  "delivery_id",                 limit: 4
    t.string   "status",                      limit: 255
    t.text     "comment",                     limit: 65535
    t.decimal  "price",                                     precision: 10
    t.boolean  "active",                                                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id",                     limit: 4
    t.string   "identifier",                  limit: 255
    t.integer  "point",                       limit: 4
    t.integer  "percent",                     limit: 4
    t.integer  "note_id",                     limit: 4
    t.integer  "bonus",                       limit: 4
    t.integer  "punishment",                  limit: 4
    t.string   "payment_service",             limit: 255
    t.string   "payment_identifier",          limit: 255
    t.string   "delivery_service",            limit: 255
    t.string   "delivery_identifier",         limit: 255
    t.text     "remark",                      limit: 65535
    t.integer  "lock_version",                limit: 4,                    default: 0
    t.integer  "circle_id",                   limit: 4
    t.integer  "link_id",                     limit: 4
    t.string   "delivery_time",               limit: 255
    t.string   "invoice_type",                limit: 255
    t.string   "invoice_title",               limit: 255
    t.string   "invoice_content",             limit: 255
    t.integer  "click_id",                    limit: 4
    t.integer  "invoice_contact_id",          limit: 4
    t.boolean  "receipted",                                                default: false, null: false
    t.datetime "receipted_at"
    t.string   "delivery_phone",              limit: 255
    t.integer  "editor_id",                   limit: 4
    t.integer  "audit_editor_id",             limit: 4
    t.datetime "audit_at"
    t.integer  "ship_editor_id",              limit: 4
    t.datetime "ship_at"
    t.integer  "freeze_editor_id",            limit: 4
    t.datetime "freeze_at"
    t.integer  "receipt_editor_id",           limit: 4
    t.integer  "prepare_editor_id",           limit: 4
    t.datetime "prepare_at"
    t.integer  "original_id",                 limit: 4
    t.string   "invoice_delivery_service",    limit: 255
    t.string   "invoice_delivery_identifier", limit: 255
    t.text     "invoice_remark",              limit: 65535
    t.datetime "delivery_received_at"
    t.string   "checkout_token",              limit: 255
    t.string   "checkout_comment",            limit: 255
    t.string   "checkout_name",               limit: 255
    t.string   "package_from",                limit: 255
    t.string   "package_to",                  limit: 255
    t.string   "package_content",             limit: 255
    t.integer  "delivery_receipted_amount",   limit: 4
    t.datetime "delivery_receipted_at"
    t.datetime "delivery_remitted_at"
    t.integer  "delivery_settled_amount",     limit: 4
    t.datetime "delivery_settled_at"
    t.datetime "delivery_reconciled_at"
    t.boolean  "is_present",                                               default: false, null: false
    t.string   "client",                      limit: 255
    t.integer  "payment_price",               limit: 4
    t.string   "texas_holdem_code",           limit: 255
    t.string   "whisper_style",               limit: 255
    t.string   "whisper_from",                limit: 255
    t.string   "whisper_to",                  limit: 255
    t.string   "whisper_content",             limit: 255
    t.integer  "shop_id",                     limit: 4
    t.integer  "guide_id",                    limit: 4
    t.string   "shop_identifier",             limit: 255
    t.text     "payment_return",              limit: 65535
    t.integer  "latest_link_id",              limit: 4
    t.integer  "latest_click_id",             limit: 4
    t.integer  "mall_promotion_id",           limit: 4
    t.integer  "u_price",                     limit: 4
    t.integer  "balance_price",               limit: 4
    t.datetime "pay_at"
    t.integer  "pay_editor_id",               limit: 4
    t.integer  "delivery_price",              limit: 4
    t.integer  "location_id",                 limit: 4,                    default: 1
    t.integer  "block_editor_id",             limit: 4
    t.datetime "block_at"
    t.datetime "wtd_pushed_at"
    t.integer  "group_id",                    limit: 4
    t.integer  "coupon_id",                   limit: 4
    t.integer  "tax_price",                   limit: 4
    t.string   "foreign_status",              limit: 255
    t.text     "foreign_delivery_infos",      limit: 65535
    t.integer  "gift_count",                  limit: 4,                    default: 1
    t.integer  "gift_per_count",              limit: 4,                    default: 1
    t.integer  "gift_gotten",                 limit: 4,                    default: 0
    t.string   "guest_token",                 limit: 255
    t.integer  "gift_from",                   limit: 4
    t.string   "gift_remark",                 limit: 255
    t.string   "giver_mobile",                limit: 255
    t.boolean  "is_gift",                                                  default: false
    t.datetime "receive_gift_at"
  end

  add_index "auction_trades", ["active", "id"], name: "by_active_and_id", using: :btree
  add_index "auction_trades", ["active", "user_id", "created_at"], name: "by_active_and_user_id_and_created_at", using: :btree
  add_index "auction_trades", ["created_at", "contact_id", "id"], name: "by_created_at_and_contact_id_and_id", using: :btree
  add_index "auction_trades", ["gift_from"], name: "index_auction_trades_on_gift_from", using: :btree
  add_index "auction_trades", ["giver_mobile"], name: "index_auction_trades_on_giver_mobile", using: :btree
  add_index "auction_trades", ["group_id"], name: "index_auction_trades_on_group_id", using: :btree
  add_index "auction_trades", ["guest_token"], name: "index_auction_trades_on_guest_token", using: :btree
  add_index "auction_trades", ["id", "guest_token"], name: "index_auction_trades_on_id_and_guest_token", using: :btree
  add_index "auction_trades", ["is_gift"], name: "index_auction_trades_on_is_gift", using: :btree
  add_index "auction_trades", ["link_id"], name: "index_auction_trades_on_link_id", using: :btree
  add_index "auction_trades", ["receive_gift_at"], name: "index_auction_trades_on_receive_gift_at", using: :btree
  add_index "auction_trades", ["status", "contact_id"], name: "by_status_and_contact_id", using: :btree
  add_index "auction_trades", ["status"], name: "index_auction_trades_on_status", using: :btree
  add_index "auction_trades", ["user_id", "status"], name: "by_user_id_and_status", using: :btree

  create_table "auction_trades_updatings", force: :cascade do |t|
    t.integer  "trade_id",     limit: 4
    t.string   "status",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version", limit: 4,   default: 0
  end

  add_index "auction_trades_updatings", ["trade_id"], name: "index_auction_trades_updatings_on_trade_id", using: :btree

  create_table "auction_transactions", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "balance",      limit: 4
    t.integer  "change",       limit: 4
    t.integer  "card_id",      limit: 4
    t.integer  "trade_id",     limit: 4
    t.text     "remark",       limit: 65535
    t.integer  "editor_id",    limit: 4
    t.integer  "lock_version", limit: 4,     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "unit_id",      limit: 4
  end

  create_table "auction_units", force: :cascade do |t|
    t.integer  "trade_id",                 limit: 4
    t.integer  "item_id",                  limit: 4
    t.integer  "circle_id",                limit: 4
    t.integer  "discount",                 limit: 4
    t.integer  "price",                    limit: 4
    t.integer  "percent",                  limit: 4
    t.integer  "point",                    limit: 4
    t.integer  "bonus",                    limit: 4
    t.boolean  "contributed",                                                     default: false, null: false
    t.boolean  "returned",                                                        default: false, null: false
    t.boolean  "active",                                                          default: true,  null: false
    t.integer  "lock_version",             limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "status",                   limit: 255
    t.integer  "return_editor_id",         limit: 4
    t.datetime "returned_at"
    t.text     "remark",                   limit: 65535
    t.string   "return_phone",             limit: 255
    t.string   "return_name",              limit: 255
    t.string   "return_bank",              limit: 255
    t.string   "return_account",           limit: 255
    t.datetime "request_at"
    t.datetime "audit_at"
    t.datetime "receive_at"
    t.integer  "audit_editor_id",          limit: 4
    t.integer  "receive_editor_id",        limit: 4
    t.datetime "freeze_at"
    t.integer  "freeze_editor_id",         limit: 4
    t.string   "return_branch",            limit: 255
    t.string   "return_province",          limit: 255
    t.string   "return_city",              limit: 255
    t.integer  "editor_id",                limit: 4
    t.integer  "request_editor_id",        limit: 4
    t.integer  "transfer_editor_id",       limit: 4
    t.datetime "transfer_at"
    t.boolean  "prepared",                                                        default: false, null: false
    t.text     "prepare_remark",           limit: 65535
    t.integer  "voucher_id",               limit: 4
    t.integer  "amount_received",          limit: 4
    t.integer  "amount_returned",          limit: 4
    t.integer  "amount_receive_editor_id", limit: 4
    t.datetime "amount_received_at"
    t.string   "return_reason",            limit: 255
    t.datetime "amount_returned_at"
    t.integer  "amount_return_editor_id",  limit: 4
    t.boolean  "core_point_added",                                                default: false, null: false
    t.boolean  "core_point_subtracted",                                           default: false, null: false
    t.boolean  "auction_point_added",                                             default: false, null: false
    t.boolean  "auction_point_subtracted",                                        default: false, null: false
    t.integer  "multibuy_id",              limit: 4
    t.integer  "amount_balance_returned",  limit: 4
    t.integer  "guide_percent",            limit: 4
    t.integer  "level_percent",            limit: 4
    t.integer  "point_percent",            limit: 4
    t.string   "receipt_number",           limit: 255
    t.integer  "user_id",                  limit: 4
    t.integer  "u_lower_limit",            limit: 4
    t.integer  "u_upper_limit",            limit: 4
    t.integer  "u_price",                  limit: 4
    t.integer  "balance_price",            limit: 4
    t.integer  "payment_price",            limit: 4
    t.integer  "mall_id",                  limit: 4
    t.integer  "category1_id",             limit: 4
    t.integer  "category2_id",             limit: 4
    t.string   "target",                   limit: 255
    t.string   "label",                    limit: 255
    t.string   "prefix",                   limit: 255
    t.integer  "location_id",              limit: 4
    t.decimal  "tax_rate",                               precision: 10, scale: 4
    t.boolean  "foreign_payment"
  end

  add_index "auction_units", ["item_id", "status"], name: "by_item_id_and_status", using: :btree
  add_index "auction_units", ["request_at", "status", "id"], name: "by_request_at_and_status_and_id", using: :btree
  add_index "auction_units", ["trade_id"], name: "index_auction_units_on_trade_id", using: :btree

  create_table "auction_usages", force: :cascade do |t|
    t.integer "user_id",      limit: 4
    t.integer "coupon_id",    limit: 4
    t.integer "lock_version", limit: 4,   default: 0, null: false
    t.string  "subcode",      limit: 255
  end

  add_index "auction_usages", ["user_id", "coupon_id"], name: "by_user_id_and_coupon_id", using: :btree

  create_table "auction_users", force: :cascade do |t|
    t.string   "name",                       limit: 255
    t.string   "sex",                        limit: 255
    t.string   "pic",                        limit: 255
    t.date     "birthday"
    t.text     "friend_ids",                 limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",               limit: 4,     default: 0
    t.text     "cart_data",                  limit: 65535
    t.integer  "level_id",                   limit: 4,     default: 1
    t.integer  "editor_id",                  limit: 4
    t.integer  "suggested_level_id",         limit: 4
    t.integer  "percent",                    limit: 4
    t.string   "mall_ids",                   limit: 255
    t.integer  "trades_amount",              limit: 4
    t.text     "remark",                     limit: 65535
    t.integer  "trades_price_sum",           limit: 4
    t.integer  "trades_point",               limit: 4
    t.datetime "trades_point_calculated_at"
    t.datetime "level_modified_at"
    t.string   "id_number",                  limit: 255
    t.integer  "balance",                    limit: 4,     default: 0, null: false
    t.string   "crypted_password",           limit: 255
    t.string   "label",                      limit: 255
    t.string   "card_number",                limit: 255
    t.integer  "service_editor_id",          limit: 4
    t.integer  "customer_id",                limit: 4
    t.string   "texas_holdem_code",          limit: 255
    t.integer  "default_contact_id",         limit: 4
    t.string   "default_payment_service",    limit: 255
  end

  create_table "auction_users_updatings", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "level_id",     limit: 4
    t.integer  "percent",      limit: 4
    t.string   "mall_ids",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "trades_point", limit: 4
    t.text     "remark",       limit: 65535
  end

  create_table "auction_values", force: :cascade do |t|
    t.integer  "editor_id",      limit: 4
    t.integer  "product_id",     limit: 4
    t.integer  "attribute_id",   limit: 4
    t.string   "content",        limit: 255
    t.boolean  "active",                     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attribute_name", limit: 255
    t.integer  "lock_version",   limit: 4,   default: 0
  end

  add_index "auction_values", ["active", "attribute_id", "product_id"], name: "index_auction_values_on_active_and_attribute_id_and_product_id", using: :btree
  add_index "auction_values", ["active", "attribute_name", "content"], name: "by_active_and_attribute_name_and_content", using: :btree
  add_index "auction_values", ["active", "product_id"], name: "by_active_and_product_id", using: :btree
  add_index "auction_values", ["attribute_name"], name: "index_auction_values_on_attribute_name", using: :btree

  create_table "auction_values_20110303", force: :cascade do |t|
    t.integer  "editor_id",      limit: 4
    t.integer  "product_id",     limit: 4
    t.integer  "attribute_id",   limit: 4
    t.string   "content",        limit: 255
    t.boolean  "active",                     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attribute_name", limit: 255
  end

  create_table "auction_videos", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "product_id",   limit: 4
    t.string   "pic",          limit: 255
    t.text     "description",  limit: 65535
    t.boolean  "active",                     default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mp4",          limit: 255
    t.string   "flv",          limit: 255
    t.string   "swf",          limit: 255
    t.boolean  "has_audio"
    t.integer  "lock_version", limit: 4,     default: 0
    t.string   "hd",           limit: 255
  end

  add_index "auction_videos", ["active", "product_id"], name: "by_active_and_product_id", using: :btree

  create_table "auction_videos_20110303", force: :cascade do |t|
    t.integer  "editor_id",   limit: 4
    t.integer  "product_id",  limit: 4
    t.string   "pic",         limit: 255
    t.text     "description", limit: 65535
    t.boolean  "active",                    default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "mp4",         limit: 255
    t.string   "flv",         limit: 255
    t.string   "swf",         limit: 255
  end

  create_table "auction_vouchers", force: :cascade do |t|
    t.integer  "event_id",     limit: 4
    t.integer  "editor_id",    limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "trade_id",     limit: 4
    t.string   "identifier",   limit: 255
    t.datetime "obtained_at"
    t.datetime "used_at"
    t.text     "remark",       limit: 65535
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auction_vouchers", ["active", "event_id"], name: "by_active_and_event_id", using: :btree
  add_index "auction_vouchers", ["active", "identifier"], name: "index_auction_vouchers_on_active_and_identifier", using: :btree
  add_index "auction_vouchers", ["active", "user_id"], name: "by_active_and_user_id", using: :btree
  add_index "auction_vouchers", ["identifier"], name: "index_auction_vouchers_on_identifier", using: :btree
  add_index "auction_vouchers", ["trade_id"], name: "index_auction_vouchers_on_trade_id", using: :btree

  create_table "blog_notes", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.string   "title",        limit: 255
    t.text     "content",      limit: 65535
    t.text     "privacy",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "album_id",     limit: 4
    t.boolean  "contribute"
    t.boolean  "import"
    t.string   "photo_ids",    limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.text     "geolocation",  limit: 65535
    t.boolean  "publish",                    default: true
    t.string   "category",     limit: 255
    t.boolean  "accept"
    t.boolean  "reject"
  end

  add_index "blog_notes", ["accept"], name: "index_blog_notes_on_accept", using: :btree
  add_index "blog_notes", ["active"], name: "index_blog_notes_on_active", using: :btree
  add_index "blog_notes", ["album_id"], name: "index_blog_notes_on_album_id", using: :btree
  add_index "blog_notes", ["contribute"], name: "index_blog_notes_on_contribute", using: :btree
  add_index "blog_notes", ["created_at"], name: "index_blog_notes_on_created_at", using: :btree
  add_index "blog_notes", ["destroyed_at"], name: "index_blog_notes_on_destroyed_at", using: :btree
  add_index "blog_notes", ["feed_id"], name: "index_blog_notes_on_feed_id", using: :btree
  add_index "blog_notes", ["import"], name: "index_blog_notes_on_import", using: :btree
  add_index "blog_notes", ["publish"], name: "index_blog_notes_on_publish", using: :btree
  add_index "blog_notes", ["reject"], name: "index_blog_notes_on_reject", using: :btree
  add_index "blog_notes", ["updated_at"], name: "index_blog_notes_on_updated_at", using: :btree
  add_index "blog_notes", ["user_id"], name: "index_blog_notes_on_user_id", using: :btree

  create_table "blog_notes_readings", force: :cascade do |t|
    t.integer  "note_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_notes_readings", ["created_at"], name: "index_blog_notes_readings_on_created_at", using: :btree
  add_index "blog_notes_readings", ["note_id"], name: "index_blog_notes_readings_on_note_id", using: :btree
  add_index "blog_notes_readings", ["updated_at"], name: "index_blog_notes_readings_on_updated_at", using: :btree
  add_index "blog_notes_readings", ["user_id"], name: "index_blog_notes_readings_on_user_id", using: :btree

  create_table "blog_notes_updatings", force: :cascade do |t|
    t.integer  "note_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_notes_updatings", ["created_at"], name: "index_blog_notes_updatings_on_created_at", using: :btree
  add_index "blog_notes_updatings", ["note_id"], name: "index_blog_notes_updatings_on_note_id", using: :btree
  add_index "blog_notes_updatings", ["updated_at"], name: "index_blog_notes_updatings_on_updated_at", using: :btree

  create_table "blog_relations", force: :cascade do |t|
    t.integer  "note_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
  end

  add_index "blog_relations", ["active"], name: "index_blog_relations_on_active", using: :btree
  add_index "blog_relations", ["created_at"], name: "index_blog_relations_on_created_at", using: :btree
  add_index "blog_relations", ["destroyed_at"], name: "index_blog_relations_on_destroyed_at", using: :btree
  add_index "blog_relations", ["note_id"], name: "index_blog_relations_on_note_id", using: :btree
  add_index "blog_relations", ["updated_at"], name: "index_blog_relations_on_updated_at", using: :btree
  add_index "blog_relations", ["user_id"], name: "index_blog_relations_on_user_id", using: :btree

  create_table "blog_relations_updatings", force: :cascade do |t|
    t.integer  "relation_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_relations_updatings", ["created_at"], name: "index_blog_relations_updatings_on_created_at", using: :btree
  add_index "blog_relations_updatings", ["relation_id"], name: "index_blog_relations_updatings_on_relation_id", using: :btree
  add_index "blog_relations_updatings", ["updated_at"], name: "index_blog_relations_updatings_on_updated_at", using: :btree

  create_table "blog_users", force: :cascade do |t|
    t.string   "pic",        limit: 255
    t.string   "name",       limit: 20
    t.string   "sex",        limit: 20
    t.date     "birthday"
    t.text     "friend_ids", limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "blog_users", ["birthday"], name: "index_blog_users_on_birthday", using: :btree
  add_index "blog_users", ["created_at"], name: "index_blog_users_on_created_at", using: :btree
  add_index "blog_users", ["login_at"], name: "index_blog_users_on_login_at", using: :btree
  add_index "blog_users", ["updated_at"], name: "index_blog_users_on_updated_at", using: :btree

  create_table "cashier_orders", force: :cascade do |t|
    t.string   "action",     limit: 255
    t.string   "serial",     limit: 255
    t.string   "user_code",  limit: 255
    t.float    "price",      limit: 24
    t.float    "deal_price", limit: 24
    t.float    "payment",    limit: 24
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "cashier_payments", force: :cascade do |t|
    t.string   "serial",           limit: 255
    t.string   "type",             limit: 255
    t.string   "number",           limit: 255
    t.float    "price",            limit: 24
    t.float    "change",           limit: 24
    t.string   "name",             limit: 255
    t.string   "sys_reference",    limit: 255
    t.string   "trace",            limit: 255
    t.string   "auth_code",        limit: 255
    t.string   "terminal_id",      limit: 255
    t.datetime "trans_time"
    t.integer  "cashier_order_id", limit: 4
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "circle_photos", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.string   "pic",          limit: 255
    t.string   "title",        limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "geolocation",  limit: 65535
  end

  add_index "circle_photos", ["user_id"], name: "index_circle_photos_on_user_id", using: :btree

  create_table "circle_photos_readings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "photo_id",   limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "circle_photos_updatings", force: :cascade do |t|
    t.integer  "photo_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "circle_relations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "photo_id",     limit: 4
    t.integer  "brand_id",     limit: 4
    t.string   "category",     limit: 255
    t.string   "color",        limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "position",     limit: 65535
    t.string   "brand_name",   limit: 255
  end

  add_index "circle_relations", ["photo_id", "active"], name: "by_photo_id_and_active", using: :btree

  create_table "circle_users", force: :cascade do |t|
    t.string   "pic",        limit: 255
    t.string   "name",       limit: 255
    t.string   "sex",        limit: 255
    t.date     "birthday"
    t.text     "friend_ids", limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "content_articles", force: :cascade do |t|
    t.integer  "category_id",   limit: 4
    t.integer  "column_id",     limit: 4
    t.integer  "source_id",     limit: 4
    t.integer  "editor_id",     limit: 4
    t.integer  "page_id",       limit: 4
    t.integer  "feed_id",       limit: 4
    t.integer  "level",         limit: 4,     default: 3
    t.string   "title1",        limit: 255
    t.string   "summary1",      limit: 255
    t.integer  "image1_id",     limit: 4
    t.string   "title3",        limit: 255
    t.string   "summary3",      limit: 255
    t.integer  "image3_id",     limit: 4
    t.string   "title",         limit: 255
    t.string   "summary",       limit: 255
    t.integer  "image_id",      limit: 4
    t.text     "content",       limit: 65535
    t.integer  "ratings_count", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_articles", ["category_id"], name: "index_content_articles_on_category_id", using: :btree
  add_index "content_articles", ["column_id"], name: "index_content_articles_on_column_id", using: :btree
  add_index "content_articles", ["created_at"], name: "index_content_articles_on_created_at", using: :btree
  add_index "content_articles", ["editor_id"], name: "index_content_articles_on_editor_id", using: :btree
  add_index "content_articles", ["image1_id"], name: "index_content_articles_on_image1_id", using: :btree
  add_index "content_articles", ["image3_id"], name: "index_content_articles_on_image3_id", using: :btree
  add_index "content_articles", ["image_id"], name: "index_content_articles_on_image_id", using: :btree
  add_index "content_articles", ["page_id"], name: "index_content_articles_on_page_id", using: :btree
  add_index "content_articles", ["source_id"], name: "index_content_articles_on_source_id", using: :btree
  add_index "content_articles", ["updated_at"], name: "index_content_articles_on_updated_at", using: :btree

  create_table "content_categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_categories", ["created_at"], name: "index_content_categories_on_created_at", using: :btree
  add_index "content_categories", ["updated_at"], name: "index_content_categories_on_updated_at", using: :btree

  create_table "content_columns", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_columns", ["created_at"], name: "index_content_columns_on_created_at", using: :btree
  add_index "content_columns", ["updated_at"], name: "index_content_columns_on_updated_at", using: :btree

  create_table "content_editors", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.string   "level",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_editors", ["created_at"], name: "index_content_editors_on_created_at", using: :btree
  add_index "content_editors", ["id"], name: "index_content_editors_on_id", using: :btree
  add_index "content_editors", ["updated_at"], name: "index_content_editors_on_updated_at", using: :btree

  create_table "content_favorites", force: :cascade do |t|
    t.integer  "article_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "rating",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_favorites", ["article_id"], name: "index_content_favorites_on_article_id", using: :btree
  add_index "content_favorites", ["created_at"], name: "index_content_favorites_on_created_at", using: :btree
  add_index "content_favorites", ["updated_at"], name: "index_content_favorites_on_updated_at", using: :btree
  add_index "content_favorites", ["user_id"], name: "index_content_favorites_on_user_id", using: :btree

  create_table "content_images", force: :cascade do |t|
    t.integer  "article_id",   limit: 4
    t.string   "path",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "filename",     limit: 255
    t.string   "content_type", limit: 255
    t.integer  "size",         limit: 4
  end

  add_index "content_images", ["article_id"], name: "index_content_images_on_article_id", using: :btree
  add_index "content_images", ["created_at"], name: "index_content_images_on_created_at", using: :btree
  add_index "content_images", ["updated_at"], name: "index_content_images_on_updated_at", using: :btree

  create_table "content_pages", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_pages", ["created_at"], name: "index_content_pages_on_created_at", using: :btree
  add_index "content_pages", ["updated_at"], name: "index_content_pages_on_updated_at", using: :btree

  create_table "content_sources", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_sources", ["created_at"], name: "index_content_sources_on_created_at", using: :btree
  add_index "content_sources", ["updated_at"], name: "index_content_sources_on_updated_at", using: :btree

  create_table "content_statics", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.text     "content",    limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_statics", ["created_at"], name: "index_content_statics_on_created_at", using: :btree
  add_index "content_statics", ["updated_at"], name: "index_content_statics_on_updated_at", using: :btree

  create_table "content_tags", force: :cascade do |t|
    t.integer  "article_id", limit: 4
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_tags", ["article_id"], name: "index_content_tags_on_article_id", using: :btree
  add_index "content_tags", ["created_at"], name: "index_content_tags_on_created_at", using: :btree
  add_index "content_tags", ["updated_at"], name: "index_content_tags_on_updated_at", using: :btree

  create_table "content_topic_articles", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "summary",    limit: 255
    t.text     "content",    limit: 65535
    t.integer  "image_id",   limit: 4
    t.integer  "image3_id",  limit: 4
    t.integer  "topic_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_topic_articles", ["created_at"], name: "index_content_topic_articles_on_created_at", using: :btree
  add_index "content_topic_articles", ["image3_id"], name: "index_content_topic_articles_on_image3_id", using: :btree
  add_index "content_topic_articles", ["image_id"], name: "index_content_topic_articles_on_image_id", using: :btree
  add_index "content_topic_articles", ["updated_at"], name: "index_content_topic_articles_on_updated_at", using: :btree

  create_table "content_topic_images", force: :cascade do |t|
    t.string   "filename",         limit: 255
    t.integer  "size",             limit: 4
    t.text     "description",      limit: 65535
    t.string   "path",             limit: 255
    t.integer  "topic_article_id", limit: 4
    t.string   "content_type",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_topic_images", ["created_at"], name: "index_content_topic_images_on_created_at", using: :btree
  add_index "content_topic_images", ["topic_article_id"], name: "index_content_topic_images_on_topic_article_id", using: :btree
  add_index "content_topic_images", ["updated_at"], name: "index_content_topic_images_on_updated_at", using: :btree

  create_table "content_users", force: :cascade do |t|
    t.string   "pic",        limit: 255
    t.string   "name",       limit: 20
    t.string   "sex",        limit: 20
    t.date     "birthday"
    t.text     "friend_ids", limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "content_users", ["birthday"], name: "index_content_users_on_birthday", using: :btree
  add_index "content_users", ["created_at"], name: "index_content_users_on_created_at", using: :btree
  add_index "content_users", ["id"], name: "index_content_users_on_id", using: :btree
  add_index "content_users", ["login_at"], name: "index_content_users_on_login_at", using: :btree
  add_index "content_users", ["updated_at"], name: "index_content_users_on_updated_at", using: :btree

  create_table "core_accounts", force: :cascade do |t|
    t.string   "email",                            limit: 100
    t.string   "crypted_password",                 limit: 40
    t.string   "salt",                             limit: 40
    t.string   "remember_token",                   limit: 40
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",                  limit: 40
    t.datetime "activated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                                       default: true
    t.datetime "destroyed_at"
    t.integer  "referrer_id",                      limit: 4
    t.string   "source",                           limit: 255
    t.string   "information",                      limit: 255
    t.integer  "link_id",                          limit: 4
    t.string   "phone",                            limit: 255
    t.datetime "phone_activated_at"
    t.string   "phone_activation_code",            limit: 255
    t.datetime "phone_activation_code_expired_at"
    t.string   "ip_address",                       limit: 255
    t.integer  "click_id",                         limit: 4
    t.string   "client",                           limit: 255
    t.integer  "shop_id",                          limit: 4
    t.integer  "guide_id",                         limit: 4
    t.integer  "latest_link_id",                   limit: 4
    t.integer  "latest_click_id",                  limit: 4
    t.date     "last_login_on"
    t.string   "location",                         limit: 255
  end

  add_index "core_accounts", ["active", "activated_at", "id"], name: "by_active_and_activated_at_and_id", using: :btree
  add_index "core_accounts", ["email"], name: "index_core_accounts_on_email", unique: true, using: :btree
  add_index "core_accounts", ["ip_address", "created_at"], name: "by_ip_address_and_created_at", using: :btree
  add_index "core_accounts", ["link_id"], name: "index_core_accounts_on_link_id", using: :btree
  add_index "core_accounts", ["phone"], name: "index_core_accounts_on_phone", using: :btree

  create_table "core_accounts_updatings", force: :cascade do |t|
    t.integer  "account_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "phone",      limit: 255
  end

  add_index "core_accounts_updatings", ["account_id"], name: "index_core_accounts_updatings_on_account_id", using: :btree
  add_index "core_accounts_updatings", ["created_at"], name: "index_core_accounts_updatings_on_created_at", using: :btree
  add_index "core_accounts_updatings", ["updated_at"], name: "index_core_accounts_updatings_on_updated_at", using: :btree

  create_table "core_affiliations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "network_id",   limit: 4
    t.date     "started_at"
    t.date     "ended_at"
    t.string   "position",     limit: 40
    t.string   "profession",   limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "college_id",   limit: 4
    t.boolean  "active",                  default: true
    t.datetime "destroyed_at"
  end

  add_index "core_affiliations", ["active"], name: "index_core_affiliations_on_active", using: :btree
  add_index "core_affiliations", ["college_id"], name: "index_core_affiliations_on_college_id", using: :btree
  add_index "core_affiliations", ["created_at"], name: "index_core_affiliations_on_created_at", using: :btree
  add_index "core_affiliations", ["destroyed_at"], name: "index_core_affiliations_on_destroyed_at", using: :btree
  add_index "core_affiliations", ["ended_at"], name: "index_core_affiliations_on_ended_at", using: :btree
  add_index "core_affiliations", ["network_id"], name: "index_core_affiliations_on_network_id", using: :btree
  add_index "core_affiliations", ["started_at"], name: "index_core_affiliations_on_started_at", using: :btree
  add_index "core_affiliations", ["updated_at"], name: "index_core_affiliations_on_updated_at", using: :btree
  add_index "core_affiliations", ["user_id", "network_id"], name: "index_core_affiliations_on_user_id_and_network_id", using: :btree
  add_index "core_affiliations", ["user_id"], name: "index_core_affiliations_on_user_id", using: :btree

  create_table "core_affiliations_updatings", force: :cascade do |t|
    t.integer  "affiliation_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_affiliations_updatings", ["affiliation_id"], name: "index_core_affiliations_updatings_on_affiliation_id", using: :btree
  add_index "core_affiliations_updatings", ["created_at"], name: "index_core_affiliations_updatings_on_created_at", using: :btree
  add_index "core_affiliations_updatings", ["updated_at"], name: "index_core_affiliations_updatings_on_updated_at", using: :btree

  create_table "core_apps", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "name",          limit: 40
    t.text     "description",   limit: 65535
    t.string   "icon",          limit: 255
    t.string   "bookmark_url",  limit: 255
    t.string   "authorize_url", limit: 255
    t.string   "remove_url",    limit: 255
    t.string   "api_key",       limit: 40
    t.string   "secret",        limit: 40
    t.boolean  "official"
    t.boolean  "default"
    t.boolean  "hide"
    t.boolean  "mini"
    t.boolean  "comment"
    t.boolean  "like"
    t.boolean  "share"
    t.boolean  "link"
    t.integer  "limit",         limit: 4
    t.string   "period",        limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_apps", ["comment"], name: "index_core_apps_on_comment", using: :btree
  add_index "core_apps", ["created_at"], name: "index_core_apps_on_created_at", using: :btree
  add_index "core_apps", ["default"], name: "index_core_apps_on_default", using: :btree
  add_index "core_apps", ["hide"], name: "index_core_apps_on_hide", using: :btree
  add_index "core_apps", ["like"], name: "index_core_apps_on_like", using: :btree
  add_index "core_apps", ["link"], name: "index_core_apps_on_link", using: :btree
  add_index "core_apps", ["mini"], name: "index_core_apps_on_mini", using: :btree
  add_index "core_apps", ["official"], name: "index_core_apps_on_official", using: :btree
  add_index "core_apps", ["share"], name: "index_core_apps_on_share", using: :btree
  add_index "core_apps", ["updated_at"], name: "index_core_apps_on_updated_at", using: :btree

  create_table "core_authorizations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "app_id",       limit: 4
    t.boolean  "active",                 default: true
    t.boolean  "tab"
    t.boolean  "box"
    t.boolean  "bookmark"
    t.boolean  "notification"
    t.boolean  "request"
    t.boolean  "email"
    t.boolean  "feed"
    t.boolean  "home"
    t.integer  "times",        limit: 4
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_authorizations", ["active"], name: "index_core_authorizations_on_active", using: :btree
  add_index "core_authorizations", ["app_id"], name: "index_core_authorizations_on_app_id", using: :btree
  add_index "core_authorizations", ["bookmark"], name: "index_core_authorizations_on_bookmark", using: :btree
  add_index "core_authorizations", ["box"], name: "index_core_authorizations_on_box", using: :btree
  add_index "core_authorizations", ["created_at"], name: "index_core_authorizations_on_created_at", using: :btree
  add_index "core_authorizations", ["email"], name: "index_core_authorizations_on_email", using: :btree
  add_index "core_authorizations", ["feed"], name: "index_core_authorizations_on_feed", using: :btree
  add_index "core_authorizations", ["home"], name: "index_core_authorizations_on_home", using: :btree
  add_index "core_authorizations", ["notification"], name: "index_core_authorizations_on_notification", using: :btree
  add_index "core_authorizations", ["published_at"], name: "index_core_authorizations_on_published_at", using: :btree
  add_index "core_authorizations", ["request"], name: "index_core_authorizations_on_request", using: :btree
  add_index "core_authorizations", ["tab"], name: "index_core_authorizations_on_tab", using: :btree
  add_index "core_authorizations", ["updated_at"], name: "index_core_authorizations_on_updated_at", using: :btree
  add_index "core_authorizations", ["user_id", "app_id"], name: "index_core_authorizations_on_user_id_and_app_id", using: :btree
  add_index "core_authorizations", ["user_id"], name: "index_core_authorizations_on_user_id", using: :btree

  create_table "core_blockings", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "relate_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
  end

  add_index "core_blockings", ["active"], name: "index_core_blockings_on_active", using: :btree
  add_index "core_blockings", ["created_at"], name: "index_core_blockings_on_created_at", using: :btree
  add_index "core_blockings", ["destroyed_at"], name: "index_core_blockings_on_destroyed_at", using: :btree
  add_index "core_blockings", ["relate_id"], name: "index_core_blockings_on_relate_id", using: :btree
  add_index "core_blockings", ["updated_at"], name: "index_core_blockings_on_updated_at", using: :btree
  add_index "core_blockings", ["user_id", "relate_id"], name: "index_core_blockings_on_user_id_and_relate_id", using: :btree
  add_index "core_blockings", ["user_id"], name: "index_core_blockings_on_user_id", using: :btree

  create_table "core_blockings_updatings", force: :cascade do |t|
    t.integer  "blocking_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_blockings_updatings", ["blocking_id"], name: "index_core_blockings_updatings_on_blocking_id", using: :btree
  add_index "core_blockings_updatings", ["created_at"], name: "index_core_blockings_updatings_on_created_at", using: :btree
  add_index "core_blockings_updatings", ["updated_at"], name: "index_core_blockings_updatings_on_updated_at", using: :btree

  create_table "core_cities", force: :cascade do |t|
    t.string   "country_name",  limit: 255
    t.string   "province_name", limit: 255
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                    default: true
    t.datetime "destroyed_at"
    t.integer  "user_id",       limit: 4
  end

  add_index "core_cities", ["active"], name: "index_core_cities_on_active", using: :btree
  add_index "core_cities", ["created_at"], name: "index_core_cities_on_created_at", using: :btree
  add_index "core_cities", ["destroyed_at"], name: "index_core_cities_on_destroyed_at", using: :btree
  add_index "core_cities", ["updated_at"], name: "index_core_cities_on_updated_at", using: :btree

  create_table "core_colleges", force: :cascade do |t|
    t.string   "country_name",  limit: 255
    t.string   "province_name", limit: 255
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                    default: true
    t.datetime "destroyed_at"
    t.integer  "user_id",       limit: 4
  end

  add_index "core_colleges", ["active"], name: "index_core_colleges_on_active", using: :btree
  add_index "core_colleges", ["created_at"], name: "index_core_colleges_on_created_at", using: :btree
  add_index "core_colleges", ["destroyed_at"], name: "index_core_colleges_on_destroyed_at", using: :btree
  add_index "core_colleges", ["updated_at"], name: "index_core_colleges_on_updated_at", using: :btree

  create_table "core_comments", force: :cascade do |t|
    t.integer  "feed_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "content",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
  end

  add_index "core_comments", ["active"], name: "index_core_comments_on_active", using: :btree
  add_index "core_comments", ["created_at"], name: "index_core_comments_on_created_at", using: :btree
  add_index "core_comments", ["destroyed_at"], name: "index_core_comments_on_destroyed_at", using: :btree
  add_index "core_comments", ["feed_id", "updated_at"], name: "index_core_comments_on_feed_id_and_updated_at", using: :btree
  add_index "core_comments", ["feed_id"], name: "index_core_comments_on_feed_id", using: :btree
  add_index "core_comments", ["updated_at"], name: "index_core_comments_on_updated_at", using: :btree
  add_index "core_comments", ["user_id"], name: "index_core_comments_on_user_id", using: :btree

  create_table "core_connections", force: :cascade do |t|
    t.integer  "account_id",    limit: 4
    t.string   "site",          limit: 255,                  null: false
    t.text     "token",         limit: 65535
    t.text     "secret",        limit: 65535
    t.text     "refresh_token", limit: 65535
    t.datetime "expired_at"
    t.text     "data",          limit: 65535
    t.boolean  "active",                      default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier",    limit: 255
    t.string   "email",         limit: 255
    t.string   "name",          limit: 255
    t.string   "sex",           limit: 255
    t.string   "pic",           limit: 255
    t.string   "phone",         limit: 255
    t.string   "union_id",      limit: 255
  end

  add_index "core_connections", ["account_id", "site"], name: "by_account_id_and_site", using: :btree
  add_index "core_connections", ["active", "account_id"], name: "by_active_and_account_id", using: :btree
  add_index "core_connections", ["active", "site", "identifier"], name: "by_active_and_site_and_identifier", using: :btree
  add_index "core_connections", ["identifier"], name: "index_core_connections_on_identifier", using: :btree
  add_index "core_connections", ["site"], name: "index_core_connections_on_site", using: :btree

  create_table "core_contacts", force: :cascade do |t|
    t.integer  "connection_id", limit: 4,                    null: false
    t.text     "data",          limit: 65535
    t.boolean  "active",                      default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "identifier",    limit: 255
    t.string   "email",         limit: 255
    t.string   "name",          limit: 255
    t.string   "sex",           limit: 255
    t.string   "pic",           limit: 255
  end

  add_index "core_contacts", ["active", "connection_id", "identifier"], name: "by_active_and_connection_id_and_identifier", using: :btree

  create_table "core_devices", force: :cascade do |t|
    t.integer  "account_id",                 limit: 4
    t.string   "identifier",                 limit: 255
    t.datetime "activated_at"
    t.string   "activation_code",            limit: 255
    t.datetime "activation_code_expires_at"
    t.boolean  "active",                                 default: true, null: false
    t.integer  "lock_version",               limit: 4,   default: 0,    null: false
    t.datetime "created_at",                                            null: false
    t.datetime "updated_at",                                            null: false
    t.string   "number",                     limit: 255
    t.integer  "version",                    limit: 4
  end

  add_index "core_devices", ["account_id"], name: "index_core_devices_on_account_id", using: :btree
  add_index "core_devices", ["identifier"], name: "index_core_devices_on_identifier", using: :btree

  create_table "core_feeds", force: :cascade do |t|
    t.integer  "source_id",      limit: 4
    t.integer  "actor_id",       limit: 4
    t.integer  "target_id",      limit: 4
    t.integer  "app_id",         limit: 4
    t.integer  "template_id",    limit: 4
    t.text     "content",        limit: 65535
    t.text     "attachment",     limit: 65535
    t.text     "links",          limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "privacy",        limit: 65535
    t.boolean  "active",                       default: true
    t.datetime "destroyed_at"
    t.text     "geolocation",    limit: 65535
    t.boolean  "dispatched"
    t.integer  "likes_count",    limit: 4,     default: 0
    t.integer  "comments_count", limit: 4,     default: 0
  end

  add_index "core_feeds", ["active"], name: "index_core_feeds_on_active", using: :btree
  add_index "core_feeds", ["actor_id"], name: "index_core_feeds_on_actor_id", using: :btree
  add_index "core_feeds", ["app_id"], name: "index_core_feeds_on_app_id", using: :btree
  add_index "core_feeds", ["created_at"], name: "index_core_feeds_on_created_at", using: :btree
  add_index "core_feeds", ["destroyed_at"], name: "index_core_feeds_on_destroyed_at", using: :btree
  add_index "core_feeds", ["source_id", "updated_at"], name: "index_core_feeds_on_source_id_and_updated_at", using: :btree
  add_index "core_feeds", ["source_id"], name: "index_core_feeds_on_source_id", using: :btree
  add_index "core_feeds", ["target_id"], name: "index_core_feeds_on_target_id", using: :btree
  add_index "core_feeds", ["updated_at"], name: "index_core_feeds_on_updated_at", using: :btree

  create_table "core_feeds_readings", force: :cascade do |t|
    t.integer  "feed_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_feeds_readings", ["created_at"], name: "index_core_feeds_readings_on_created_at", using: :btree
  add_index "core_feeds_readings", ["feed_id"], name: "index_core_feeds_readings_on_feed_id", using: :btree
  add_index "core_feeds_readings", ["updated_at"], name: "index_core_feeds_readings_on_updated_at", using: :btree
  add_index "core_feeds_readings", ["user_id"], name: "index_core_feeds_readings_on_user_id", using: :btree

  create_table "core_friendships", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "relate_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
  end

  add_index "core_friendships", ["active"], name: "index_core_friendships_on_active", using: :btree
  add_index "core_friendships", ["created_at"], name: "index_core_friendships_on_created_at", using: :btree
  add_index "core_friendships", ["destroyed_at"], name: "index_core_friendships_on_destroyed_at", using: :btree
  add_index "core_friendships", ["relate_id"], name: "index_core_friendships_on_relate_id", using: :btree
  add_index "core_friendships", ["updated_at"], name: "index_core_friendships_on_updated_at", using: :btree
  add_index "core_friendships", ["user_id", "relate_id"], name: "index_core_friendships_on_user_id_and_relate_id", using: :btree
  add_index "core_friendships", ["user_id"], name: "index_core_friendships_on_user_id", using: :btree

  create_table "core_friendships_updatings", force: :cascade do |t|
    t.integer  "friendship_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_friendships_updatings", ["created_at"], name: "index_core_friendships_updatings_on_created_at", using: :btree
  add_index "core_friendships_updatings", ["friendship_id"], name: "index_core_friendships_updatings_on_friendship_id", using: :btree
  add_index "core_friendships_updatings", ["updated_at"], name: "index_core_friendships_updatings_on_updated_at", using: :btree

  create_table "core_help_articles", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "category_id",  limit: 4
    t.integer  "order",        limit: 4,     default: 1
    t.string   "question",     limit: 255
    t.text     "answer",       limit: 65535
    t.string   "pic",          limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "core_help_articles_20100826", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "category_id",  limit: 4
    t.integer  "order",        limit: 4,     default: 1
    t.string   "question",     limit: 255
    t.text     "answer",       limit: 65535
    t.string   "pic",          limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "core_help_categories", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "parent_id",    limit: 4
    t.string   "name",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order",        limit: 4,   default: 1
  end

  create_table "core_help_categories_20100826", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "parent_id",    limit: 4
    t.string   "name",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order",        limit: 4,   default: 1
  end

  create_table "core_hidings", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "relate_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
  end

  add_index "core_hidings", ["active"], name: "index_core_hidings_on_active", using: :btree
  add_index "core_hidings", ["created_at"], name: "index_core_hidings_on_created_at", using: :btree
  add_index "core_hidings", ["destroyed_at"], name: "index_core_hidings_on_destroyed_at", using: :btree
  add_index "core_hidings", ["relate_id"], name: "index_core_hidings_on_relate_id", using: :btree
  add_index "core_hidings", ["updated_at"], name: "index_core_hidings_on_updated_at", using: :btree
  add_index "core_hidings", ["user_id", "relate_id"], name: "index_core_hidings_on_user_id_and_relate_id", using: :btree
  add_index "core_hidings", ["user_id"], name: "index_core_hidings_on_user_id", using: :btree

  create_table "core_hidings_updatings", force: :cascade do |t|
    t.integer  "hiding_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_hidings_updatings", ["created_at"], name: "index_core_hidings_updatings_on_created_at", using: :btree
  add_index "core_hidings_updatings", ["hiding_id"], name: "index_core_hidings_updatings_on_hiding_id", using: :btree
  add_index "core_hidings_updatings", ["updated_at"], name: "index_core_hidings_updatings_on_updated_at", using: :btree

  create_table "core_inbox", force: :cascade do |t|
    t.integer  "message_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.boolean  "unread"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "sent"
    t.boolean  "receive"
  end

  add_index "core_inbox", ["created_at"], name: "index_core_inbox_on_created_at", using: :btree
  add_index "core_inbox", ["message_id", "user_id"], name: "index_core_inbox_on_message_id_and_user_id", using: :btree
  add_index "core_inbox", ["message_id"], name: "index_core_inbox_on_message_id", using: :btree
  add_index "core_inbox", ["receive"], name: "index_core_inbox_on_receive", using: :btree
  add_index "core_inbox", ["sent"], name: "index_core_inbox_on_sent", using: :btree
  add_index "core_inbox", ["unread"], name: "index_core_inbox_on_unread", using: :btree
  add_index "core_inbox", ["updated_at"], name: "index_core_inbox_on_updated_at", using: :btree
  add_index "core_inbox", ["user_id", "receive"], name: "index_core_inbox_on_user_id_and_receive", using: :btree
  add_index "core_inbox", ["user_id", "sent"], name: "index_core_inbox_on_user_id_and_sent", using: :btree
  add_index "core_inbox", ["user_id", "unread"], name: "index_core_inbox_on_user_id_and_unread", using: :btree
  add_index "core_inbox", ["user_id"], name: "index_core_inbox_on_user_id", using: :btree

  create_table "core_infos", force: :cascade do |t|
    t.string   "im",                     limit: 255
    t.string   "mobile",                 limit: 255
    t.string   "phone",                  limit: 255
    t.string   "website",                limit: 255
    t.text     "about",                  limit: 65535
    t.text     "interest",               limit: 65535
    t.text     "music",                  limit: 65535
    t.text     "movie",                  limit: 65535
    t.text     "tvshow",                 limit: 65535
    t.text     "game",                   limit: 65535
    t.text     "comic",                  limit: 65535
    t.text     "sport",                  limit: 65535
    t.text     "book",                   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "hometown_id",            limit: 4
    t.integer  "location_id",            limit: 4
    t.string   "status",                 limit: 255
    t.integer  "gene_point",             limit: 4,     default: 0
    t.datetime "point_updated_at"
    t.boolean  "registration_completed"
    t.integer  "point",                  limit: 4,     default: 0
    t.integer  "auction_point",          limit: 4,     default: 0
  end

  add_index "core_infos", ["created_at"], name: "index_core_infos_on_created_at", using: :btree
  add_index "core_infos", ["hometown_id"], name: "index_core_infos_on_hometown_id", using: :btree
  add_index "core_infos", ["id"], name: "index_core_infos_on_id", using: :btree
  add_index "core_infos", ["location_id"], name: "index_core_infos_on_location_id", using: :btree
  add_index "core_infos", ["updated_at"], name: "index_core_infos_on_updated_at", using: :btree

  create_table "core_infos_updatings", force: :cascade do |t|
    t.integer  "info_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_infos_updatings", ["created_at"], name: "index_core_infos_updatings_on_created_at", using: :btree
  add_index "core_infos_updatings", ["info_id"], name: "index_core_infos_updatings_on_info_id", using: :btree
  add_index "core_infos_updatings", ["updated_at"], name: "index_core_infos_updatings_on_updated_at", using: :btree

  create_table "core_invitations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "email",        limit: 255
    t.integer  "app_id",       limit: 4
    t.integer  "invitee_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "code",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
  end

  add_index "core_invitations", ["active"], name: "index_core_invitations_on_active", using: :btree
  add_index "core_invitations", ["created_at"], name: "index_core_invitations_on_created_at", using: :btree
  add_index "core_invitations", ["destroyed_at"], name: "index_core_invitations_on_destroyed_at", using: :btree
  add_index "core_invitations", ["invitee_id"], name: "index_core_invitations_on_invitee_id", using: :btree
  add_index "core_invitations", ["updated_at"], name: "index_core_invitations_on_updated_at", using: :btree
  add_index "core_invitations", ["user_id", "email"], name: "index_core_invitations_on_user_id_and_email", using: :btree
  add_index "core_invitations", ["user_id"], name: "index_core_invitations_on_user_id", using: :btree

  create_table "core_invitations_updatings", force: :cascade do |t|
    t.integer  "invitation_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_invitations_updatings", ["created_at"], name: "index_core_invitations_updatings_on_created_at", using: :btree
  add_index "core_invitations_updatings", ["invitation_id"], name: "index_core_invitations_updatings_on_invitation_id", using: :btree
  add_index "core_invitations_updatings", ["updated_at"], name: "index_core_invitations_updatings_on_updated_at", using: :btree

  create_table "core_ips", force: :cascade do |t|
    t.string   "start_ip",      limit: 255
    t.string   "end_ip",        limit: 255
    t.string   "location",      limit: 255
    t.integer  "start",         limit: 4
    t.integer  "end",           limit: 4
    t.string   "country_name",  limit: 255
    t.string   "province_name", limit: 255
    t.string   "city_name",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                    default: true
    t.datetime "destroyed_at"
    t.string   "town_name",     limit: 255
  end

  add_index "core_ips", ["active"], name: "index_core_ips_on_active", using: :btree
  add_index "core_ips", ["created_at"], name: "index_core_ips_on_created_at", using: :btree
  add_index "core_ips", ["destroyed_at"], name: "index_core_ips_on_destroyed_at", using: :btree
  add_index "core_ips", ["end"], name: "by_end", using: :btree
  add_index "core_ips", ["start"], name: "by_start", using: :btree
  add_index "core_ips", ["updated_at"], name: "index_core_ips_on_updated_at", using: :btree

  create_table "core_keywords", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
  end

  add_index "core_keywords", ["active"], name: "index_core_keywords_on_active", using: :btree
  add_index "core_keywords", ["created_at"], name: "index_core_keywords_on_created_at", using: :btree
  add_index "core_keywords", ["destroyed_at"], name: "index_core_keywords_on_destroyed_at", using: :btree
  add_index "core_keywords", ["updated_at"], name: "index_core_keywords_on_updated_at", using: :btree

  create_table "core_likes", force: :cascade do |t|
    t.integer  "feed_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
  end

  add_index "core_likes", ["active"], name: "index_core_likes_on_active", using: :btree
  add_index "core_likes", ["created_at"], name: "index_core_likes_on_created_at", using: :btree
  add_index "core_likes", ["destroyed_at"], name: "index_core_likes_on_destroyed_at", using: :btree
  add_index "core_likes", ["feed_id", "user_id"], name: "index_core_likes_on_feed_id_and_user_id", using: :btree
  add_index "core_likes", ["feed_id"], name: "index_core_likes_on_feed_id", using: :btree
  add_index "core_likes", ["updated_at"], name: "index_core_likes_on_updated_at", using: :btree
  add_index "core_likes", ["user_id"], name: "index_core_likes_on_user_id", using: :btree

  create_table "core_likes_updatings", force: :cascade do |t|
    t.integer  "like_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_likes_updatings", ["created_at"], name: "index_core_likes_updatings_on_created_at", using: :btree
  add_index "core_likes_updatings", ["like_id"], name: "index_core_likes_updatings_on_like_id", using: :btree
  add_index "core_likes_updatings", ["updated_at"], name: "index_core_likes_updatings_on_updated_at", using: :btree

  create_table "core_links", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "href",         limit: 255
    t.text     "description",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "attachment",   limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.string   "content_type", limit: 255
  end

  add_index "core_links", ["active"], name: "index_core_links_on_active", using: :btree
  add_index "core_links", ["created_at"], name: "index_core_links_on_created_at", using: :btree
  add_index "core_links", ["destroyed_at"], name: "index_core_links_on_destroyed_at", using: :btree
  add_index "core_links", ["updated_at"], name: "index_core_links_on_updated_at", using: :btree
  add_index "core_links", ["user_id"], name: "index_core_links_on_user_id", using: :btree

  create_table "core_lists", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 40
    t.text     "friend_list",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.boolean  "is_default",                 default: false
  end

  add_index "core_lists", ["active"], name: "index_core_lists_on_active", using: :btree
  add_index "core_lists", ["created_at"], name: "index_core_lists_on_created_at", using: :btree
  add_index "core_lists", ["destroyed_at"], name: "index_core_lists_on_destroyed_at", using: :btree
  add_index "core_lists", ["updated_at"], name: "index_core_lists_on_updated_at", using: :btree
  add_index "core_lists", ["user_id", "updated_at"], name: "index_core_lists_on_user_id_and_updated_at", using: :btree
  add_index "core_lists", ["user_id"], name: "index_core_lists_on_user_id", using: :btree

  create_table "core_lists_readings", force: :cascade do |t|
    t.integer  "list_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_lists_readings", ["created_at"], name: "index_core_lists_readings_on_created_at", using: :btree
  add_index "core_lists_readings", ["list_id"], name: "index_core_lists_readings_on_list_id", using: :btree
  add_index "core_lists_readings", ["updated_at"], name: "index_core_lists_readings_on_updated_at", using: :btree
  add_index "core_lists_readings", ["user_id"], name: "index_core_lists_readings_on_user_id", using: :btree

  create_table "core_lists_updatings", force: :cascade do |t|
    t.integer  "list_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_lists_updatings", ["created_at"], name: "index_core_lists_updatings_on_created_at", using: :btree
  add_index "core_lists_updatings", ["list_id"], name: "index_core_lists_updatings_on_list_id", using: :btree
  add_index "core_lists_updatings", ["updated_at"], name: "index_core_lists_updatings_on_updated_at", using: :btree

  create_table "core_logins", force: :cascade do |t|
    t.integer "user_id",    limit: 4
    t.date    "login_on"
    t.string  "ip_address", limit: 20
  end

  add_index "core_logins", ["user_id", "login_on"], name: "index_core_logins_on_user_id_and_login_on", using: :btree

  create_table "core_messages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.string   "content",    limit: 255
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_messages", ["created_at"], name: "index_core_messages_on_created_at", using: :btree
  add_index "core_messages", ["updated_at"], name: "index_core_messages_on_updated_at", using: :btree
  add_index "core_messages", ["user_id"], name: "index_core_messages_on_user_id", using: :btree

  create_table "core_networks", force: :cascade do |t|
    t.string   "name",       limit: 100
    t.string   "type",       limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_networks", ["created_at"], name: "index_core_networks_on_created_at", using: :btree
  add_index "core_networks", ["name"], name: "index_core_networks_on_name", using: :btree
  add_index "core_networks", ["updated_at"], name: "index_core_networks_on_updated_at", using: :btree

  create_table "core_notifications", force: :cascade do |t|
    t.integer  "app_id",      limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "receiver_id", limit: 4
    t.text     "content",     limit: 65535
    t.boolean  "unread"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_notifications", ["app_id"], name: "index_core_notifications_on_app_id", using: :btree
  add_index "core_notifications", ["created_at"], name: "index_core_notifications_on_created_at", using: :btree
  add_index "core_notifications", ["receiver_id", "unread"], name: "index_core_notifications_on_receiver_id_and_unread", using: :btree
  add_index "core_notifications", ["receiver_id"], name: "index_core_notifications_on_receiver_id", using: :btree
  add_index "core_notifications", ["unread"], name: "index_core_notifications_on_unread", using: :btree
  add_index "core_notifications", ["updated_at"], name: "index_core_notifications_on_updated_at", using: :btree
  add_index "core_notifications", ["user_id"], name: "index_core_notifications_on_user_id", using: :btree

  create_table "core_outlook_contacts", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "filename",     limit: 255
    t.string   "content_type", limit: 255
    t.integer  "size",         limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "core_phones", force: :cascade do |t|
    t.integer  "start",             limit: 4
    t.integer  "end",               limit: 4
    t.string   "location",          limit: 255
    t.string   "original_provider", limit: 255
    t.string   "country_name",      limit: 255
    t.string   "province_name",     limit: 255
    t.string   "city_name",         limit: 255
    t.string   "town_name",         limit: 255
    t.string   "provider",          limit: 255
    t.string   "service",           limit: 255
    t.boolean  "active",                        default: true, null: false
    t.integer  "lock_version",      limit: 4,   default: 0,    null: false
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_phones", ["end"], name: "by_end", using: :btree
  add_index "core_phones", ["start"], name: "by_start", using: :btree

  create_table "core_records", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "trade_id",   limit: 4
    t.integer  "point",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_records", ["created_at"], name: "index_core_records_on_created_at", using: :btree
  add_index "core_records", ["updated_at"], name: "index_core_records_on_updated_at", using: :btree
  add_index "core_records", ["user_id", "updated_at"], name: "index_core_records_on_user_id_and_updated_at", using: :btree

  create_table "core_registrations", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "code",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "account_id",   limit: 4
  end

  create_table "core_replies", force: :cascade do |t|
    t.integer  "message_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "content",    limit: 65535
    t.text     "attachment", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_replies", ["created_at"], name: "index_core_replies_on_created_at", using: :btree
  add_index "core_replies", ["message_id"], name: "index_core_replies_on_message_id", using: :btree
  add_index "core_replies", ["updated_at"], name: "index_core_replies_on_updated_at", using: :btree
  add_index "core_replies", ["user_id"], name: "index_core_replies_on_user_id", using: :btree

  create_table "core_reports", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "url",          limit: 255
    t.string   "reason",       limit: 255
    t.text     "description",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
  end

  add_index "core_reports", ["active"], name: "index_core_reports_on_active", using: :btree
  add_index "core_reports", ["created_at"], name: "index_core_reports_on_created_at", using: :btree
  add_index "core_reports", ["destroyed_at"], name: "index_core_reports_on_destroyed_at", using: :btree
  add_index "core_reports", ["updated_at"], name: "index_core_reports_on_updated_at", using: :btree
  add_index "core_reports", ["user_id"], name: "index_core_reports_on_user_id", using: :btree

  create_table "core_requests", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "receiver_id",  limit: 4
    t.integer  "object_id",    limit: 4
    t.string   "type",         limit: 20
    t.boolean  "accept"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "content",      limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
  end

  add_index "core_requests", ["accept"], name: "index_core_requests_on_accept", using: :btree
  add_index "core_requests", ["active"], name: "index_core_requests_on_active", using: :btree
  add_index "core_requests", ["created_at"], name: "index_core_requests_on_created_at", using: :btree
  add_index "core_requests", ["destroyed_at"], name: "index_core_requests_on_destroyed_at", using: :btree
  add_index "core_requests", ["object_id"], name: "index_core_requests_on_object_id", using: :btree
  add_index "core_requests", ["receiver_id"], name: "index_core_requests_on_receiver_id_and_unread", using: :btree
  add_index "core_requests", ["updated_at"], name: "index_core_requests_on_updated_at", using: :btree
  add_index "core_requests", ["user_id"], name: "index_core_requests_on_user_id", using: :btree

  create_table "core_scores", force: :cascade do |t|
    t.integer "point",    limit: 4
    t.integer "currency", limit: 4
  end

  add_index "core_scores", ["id"], name: "index_core_scores_on_id", using: :btree

  create_table "core_settings", force: :cascade do |t|
    t.string   "profile",                              limit: 255
    t.string   "friend",                               limit: 255
    t.string   "feed",                                 limit: 255
    t.string   "basic",                                limit: 255
    t.string   "personal",                             limit: 255
    t.string   "work",                                 limit: 255
    t.string   "im",                                   limit: 255
    t.string   "mobile",                               limit: 255
    t.string   "phone",                                limit: 255
    t.string   "website",                              limit: 255
    t.string   "email",                                limit: 255
    t.string   "search",                               limit: 255
    t.boolean  "my_profile_picture"
    t.boolean  "my_friend_list"
    t.boolean  "a_link_to_add_me_as_a_friend"
    t.boolean  "a_link_to_send_me_a_message"
    t.boolean  "search_engine_indexing"
    t.boolean  "sends_me_a_message"
    t.boolean  "adds_me_as_a_friend"
    t.boolean  "confirms_a_friendship_request"
    t.boolean  "suggests_a_friend_to_me"
    t.boolean  "adds_a_friend_i_suggested"
    t.boolean  "i_invited_joins_facebook"
    t.boolean  "has_a_birthday_coming_up"
    t.boolean  "pokes_me"
    t.boolean  "posts_on_my_wall"
    t.boolean  "comments_on_a_story_in_my_wall"
    t.boolean  "comments_after_me_on_a_wall_story"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "note",                                 limit: 255
    t.string   "photo",                                limit: 255
    t.string   "share",                                limit: 255
    t.boolean  "public_search",                                    default: true
    t.boolean  "public_online_status"
    t.boolean  "receive_promotion_email"
    t.boolean  "receive_promotion_email_of_event",                 default: true
    t.boolean  "receive_promotion_email_of_voucher",               default: true
    t.boolean  "receive_promotion_email_of_news",                  default: true
    t.boolean  "receive_promotion_email_of_recommend",             default: true
    t.boolean  "receive_promotion_sms_of_event",                   default: true
    t.boolean  "receive_promotion_sms_of_voucher",                 default: true
    t.boolean  "receive_promotion_sms_of_promote",                 default: true
  end

  add_index "core_settings", ["a_link_to_add_me_as_a_friend"], name: "index_core_settings_on_a_link_to_add_me_as_a_friend", using: :btree
  add_index "core_settings", ["a_link_to_send_me_a_message"], name: "index_core_settings_on_a_link_to_send_me_a_message", using: :btree
  add_index "core_settings", ["adds_a_friend_i_suggested"], name: "index_core_settings_on_adds_a_friend_i_suggested", using: :btree
  add_index "core_settings", ["adds_me_as_a_friend"], name: "index_core_settings_on_adds_me_as_a_friend", using: :btree
  add_index "core_settings", ["comments_after_me_on_a_wall_story"], name: "index_core_settings_on_comments_after_me_on_a_wall_story", using: :btree
  add_index "core_settings", ["comments_on_a_story_in_my_wall"], name: "index_core_settings_on_comments_on_a_story_in_my_wall", using: :btree
  add_index "core_settings", ["confirms_a_friendship_request"], name: "index_core_settings_on_confirms_a_friendship_request", using: :btree
  add_index "core_settings", ["created_at"], name: "index_core_settings_on_created_at", using: :btree
  add_index "core_settings", ["has_a_birthday_coming_up"], name: "index_core_settings_on_has_a_birthday_coming_up", using: :btree
  add_index "core_settings", ["i_invited_joins_facebook"], name: "index_core_settings_on_i_invited_joins_facebook", using: :btree
  add_index "core_settings", ["id"], name: "index_core_settings_on_id", using: :btree
  add_index "core_settings", ["my_friend_list"], name: "index_core_settings_on_my_friend_list", using: :btree
  add_index "core_settings", ["my_profile_picture"], name: "index_core_settings_on_my_profile_picture", using: :btree
  add_index "core_settings", ["pokes_me"], name: "index_core_settings_on_pokes_me", using: :btree
  add_index "core_settings", ["posts_on_my_wall"], name: "index_core_settings_on_posts_on_my_wall", using: :btree
  add_index "core_settings", ["search_engine_indexing"], name: "index_core_settings_on_search_engine_indexing", using: :btree
  add_index "core_settings", ["sends_me_a_message"], name: "index_core_settings_on_sends_me_a_message", using: :btree
  add_index "core_settings", ["suggests_a_friend_to_me"], name: "index_core_settings_on_suggests_a_friend_to_me", using: :btree
  add_index "core_settings", ["updated_at"], name: "index_core_settings_on_updated_at", using: :btree

  create_table "core_settings_updatings", force: :cascade do |t|
    t.integer  "setting_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_settings_updatings", ["created_at"], name: "index_core_settings_updatings_on_created_at", using: :btree
  add_index "core_settings_updatings", ["setting_id"], name: "index_core_settings_updatings_on_setting_id", using: :btree
  add_index "core_settings_updatings", ["updated_at"], name: "index_core_settings_updatings_on_updated_at", using: :btree

  create_table "core_shares", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.integer  "object_id",    limit: 4
    t.string   "object_type",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
  end

  add_index "core_shares", ["active"], name: "index_core_shares_on_active", using: :btree
  add_index "core_shares", ["created_at"], name: "index_core_shares_on_created_at", using: :btree
  add_index "core_shares", ["destroyed_at"], name: "index_core_shares_on_destroyed_at", using: :btree
  add_index "core_shares", ["feed_id"], name: "index_core_shares_on_feed_id", using: :btree
  add_index "core_shares", ["object_id"], name: "index_core_shares_on_object_id", using: :btree
  add_index "core_shares", ["updated_at"], name: "index_core_shares_on_updated_at", using: :btree
  add_index "core_shares", ["user_id"], name: "index_core_shares_on_user_id", using: :btree

  create_table "core_shares_updatings", force: :cascade do |t|
    t.integer  "share_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_shares_updatings", ["created_at"], name: "index_core_shares_updatings_on_created_at", using: :btree
  add_index "core_shares_updatings", ["share_id"], name: "index_core_shares_updatings_on_share_id", using: :btree
  add_index "core_shares_updatings", ["updated_at"], name: "index_core_shares_updatings_on_updated_at", using: :btree

  create_table "core_similarities", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "relate_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_similarities", ["created_at"], name: "index_core_similarities_on_created_at", using: :btree
  add_index "core_similarities", ["relate_id"], name: "index_core_similarities_on_relate_id", using: :btree
  add_index "core_similarities", ["updated_at"], name: "index_core_similarities_on_updated_at", using: :btree
  add_index "core_similarities", ["user_id", "relate_id"], name: "index_core_similarities_on_user_id_and_relate_id", using: :btree
  add_index "core_similarities", ["user_id"], name: "index_core_similarities_on_user_id", using: :btree

  create_table "core_stats", force: :cascade do |t|
    t.date     "happening_on"
    t.integer  "user_total_count",           limit: 4
    t.integer  "user_total_activated_count", limit: 4
    t.integer  "user_count",                 limit: 4
    t.integer  "user_activated_count",       limit: 4
    t.integer  "login_count",                limit: 4
    t.integer  "return_count",               limit: 4
    t.integer  "return_rate",                limit: 4
    t.integer  "invitation_count",           limit: 4
    t.integer  "invited_count",              limit: 4
    t.integer  "order_count",                limit: 4
    t.integer  "sold_count",                 limit: 4
    t.integer  "buyer_count",                limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                               default: true
    t.integer  "return_rate_1",              limit: 4
    t.integer  "return_rate_2",              limit: 4
    t.integer  "return_rate_3",              limit: 4
    t.integer  "return_rate_4",              limit: 4
    t.integer  "return_rate_5",              limit: 4
    t.integer  "return_rate_6",              limit: 4
    t.integer  "return_rate_7",              limit: 4
    t.integer  "amount_count",               limit: 4
  end

  create_table "core_status", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.text     "content",      limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
  end

  add_index "core_status", ["active"], name: "index_core_status_on_active", using: :btree
  add_index "core_status", ["created_at"], name: "index_core_status_on_created_at", using: :btree
  add_index "core_status", ["destroyed_at"], name: "index_core_status_on_destroyed_at", using: :btree
  add_index "core_status", ["feed_id"], name: "index_core_status_on_feed_id", using: :btree
  add_index "core_status", ["updated_at"], name: "index_core_status_on_updated_at", using: :btree
  add_index "core_status", ["user_id"], name: "index_core_status_on_user_id", using: :btree

  create_table "core_status_updatings", force: :cascade do |t|
    t.integer  "status_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_status_updatings", ["created_at"], name: "index_core_status_updatings_on_created_at", using: :btree
  add_index "core_status_updatings", ["status_id"], name: "index_core_status_updatings_on_status_id", using: :btree
  add_index "core_status_updatings", ["updated_at"], name: "index_core_status_updatings_on_updated_at", using: :btree

  create_table "core_streams", force: :cascade do |t|
    t.integer  "source_id",  limit: 4
    t.string   "filter",     limit: 255
    t.integer  "feed_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "app_id",     limit: 4
  end

  add_index "core_streams", ["created_at"], name: "index_core_streams_on_created_at", using: :btree
  add_index "core_streams", ["feed_id"], name: "index_core_streams_on_feed_id", using: :btree
  add_index "core_streams", ["source_id", "filter", "updated_at"], name: "index_core_streams_on_source_id_and_filter_and_updated_at", using: :btree
  add_index "core_streams", ["source_id"], name: "index_core_streams_on_source_id", using: :btree
  add_index "core_streams", ["updated_at"], name: "index_core_streams_on_updated_at", using: :btree

  create_table "core_trades", force: :cascade do |t|
    t.integer  "app_id",      limit: 4
    t.string   "name",        limit: 40
    t.text     "description", limit: 65535
    t.string   "icon",        limit: 255
    t.integer  "point",       limit: 4
    t.integer  "quota",       limit: 4
    t.integer  "limit",       limit: 4
    t.string   "period",      limit: 20
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_trades", ["created_at"], name: "index_core_trades_on_created_at", using: :btree
  add_index "core_trades", ["id"], name: "index_core_trades_on_id", using: :btree
  add_index "core_trades", ["updated_at"], name: "index_core_trades_on_updated_at", using: :btree

  create_table "core_transactions", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "point",         limit: 4
    t.integer  "gene_point",    limit: 4
    t.integer  "auction_point", limit: 4
    t.integer  "incremented",   limit: 4
    t.text     "description",   limit: 65535
    t.boolean  "active",                      default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editor_id",     limit: 4
  end

  create_table "core_users", force: :cascade do |t|
    t.string   "pic",          limit: 255
    t.string   "name",         limit: 20
    t.string   "sex",          limit: 20
    t.date     "birthday"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "abbrs",        limit: 255
    t.integer  "photo_id",     limit: 4
    t.integer  "invite_count", limit: 4
    t.boolean  "active",                   default: true, null: false
  end

  add_index "core_users", ["birthday"], name: "index_core_users_on_birthday", using: :btree
  add_index "core_users", ["created_at"], name: "index_core_users_on_created_at", using: :btree
  add_index "core_users", ["id"], name: "index_core_users_on_id", using: :btree
  add_index "core_users", ["updated_at"], name: "index_core_users_on_updated_at", using: :btree

  create_table "core_users_readings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_users_readings", ["created_at"], name: "index_core_users_readings_on_created_at", using: :btree
  add_index "core_users_readings", ["updated_at"], name: "index_core_users_readings_on_updated_at", using: :btree
  add_index "core_users_readings", ["user_id"], name: "index_core_users_readings_on_user_id", using: :btree

  create_table "core_users_updatings", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_users_updatings", ["created_at"], name: "index_core_users_updatings_on_created_at", using: :btree
  add_index "core_users_updatings", ["updated_at"], name: "index_core_users_updatings_on_updated_at", using: :btree

  create_table "core_visits", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "relate_id",  limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "core_visits", ["created_at"], name: "index_core_visits_on_created_at", using: :btree
  add_index "core_visits", ["relate_id"], name: "index_core_visits_on_relate_id", using: :btree
  add_index "core_visits", ["updated_at"], name: "index_core_visits_on_updated_at", using: :btree
  add_index "core_visits", ["user_id", "relate_id"], name: "index_core_visits_on_user_id_and_relate_id", using: :btree
  add_index "core_visits", ["user_id"], name: "index_core_visits_on_user_id", using: :btree

  create_table "data_bible_articles", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.integer  "category_id",  limit: 4
    t.integer  "pattern_id",   limit: 4
    t.text     "content",      limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order",        limit: 4,     default: 1
    t.datetime "destroyed_at"
    t.boolean  "published",                  default: false, null: false
  end

  add_index "data_bible_articles", ["active"], name: "index_data_bible_articles_on_active", using: :btree
  add_index "data_bible_articles", ["category_id"], name: "index_data_bible_articles_on_category_id", using: :btree
  add_index "data_bible_articles", ["created_at"], name: "index_data_bible_articles_on_created_at", using: :btree
  add_index "data_bible_articles", ["destroyed_at"], name: "index_data_bible_articles_on_destroyed_at", using: :btree
  add_index "data_bible_articles", ["pattern_id"], name: "index_data_bible_articles_on_pattern_id", using: :btree
  add_index "data_bible_articles", ["updated_at"], name: "index_data_bible_articles_on_updated_at", using: :btree
  add_index "data_bible_articles", ["user_id"], name: "index_data_bible_articles_on_user_id", using: :btree

  create_table "data_bible_articles_readings", force: :cascade do |t|
    t.integer  "article_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_bible_articles_readings", ["article_id"], name: "index_data_bible_articles_readings_on_article_id", using: :btree
  add_index "data_bible_articles_readings", ["created_at"], name: "index_data_bible_articles_readings_on_created_at", using: :btree
  add_index "data_bible_articles_readings", ["updated_at"], name: "index_data_bible_articles_readings_on_updated_at", using: :btree
  add_index "data_bible_articles_readings", ["user_id"], name: "index_data_bible_articles_readings_on_user_id", using: :btree

  create_table "data_bible_audios", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "article_id",        limit: 4
    t.string   "path",              limit: 255
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
    t.string   "path_info",         limit: 1000, default: "{}"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
  end

  add_index "data_bible_audios", ["active"], name: "index_data_bible_audios_on_active", using: :btree
  add_index "data_bible_audios", ["created_at"], name: "index_data_bible_audios_on_created_at", using: :btree
  add_index "data_bible_audios", ["destroyed_at"], name: "index_data_bible_audios_on_destroyed_at", using: :btree
  add_index "data_bible_audios", ["updated_at"], name: "index_data_bible_audios_on_updated_at", using: :btree
  add_index "data_bible_audios", ["user_id"], name: "index_data_bible_audios_on_user_id", using: :btree

  create_table "data_bible_categories", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "parent_id",          limit: 4
    t.string   "brand_ids",          limit: 255
    t.string   "name",               limit: 255
    t.string   "description",        limit: 255
    t.string   "pic1",               limit: 255
    t.string   "pic2",               limit: 255
    t.string   "kind",               limit: 255
    t.boolean  "special",                         default: false
    t.boolean  "active",                          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order",              limit: 4,    default: 1
    t.string   "flash",              limit: 255
    t.boolean  "published",                       default: false
    t.datetime "destroyed_at"
    t.boolean  "rec",                             default: false
    t.string   "title",              limit: 255
    t.string   "cover",              limit: 255
    t.string   "logo",               limit: 255
    t.string   "logo_info",          limit: 1000, default: "{}"
    t.string   "pic1_info",          limit: 1000, default: "{}"
    t.string   "pic2_info",          limit: 1000, default: "{}"
    t.string   "cover_info",         limit: 1000, default: "{}"
    t.string   "flash_info",         limit: 1000, default: "{}"
    t.string   "logo_file_name",     limit: 255
    t.integer  "logo_file_size",     limit: 4
    t.string   "logo_content_type",  limit: 255
    t.datetime "logo_updated_at"
    t.integer  "logo_image_width",   limit: 4
    t.integer  "logo_image_height",  limit: 4
    t.string   "pic_file_name",      limit: 255
    t.integer  "pic_file_size",      limit: 4
    t.string   "pic_content_type",   limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",    limit: 4
    t.integer  "pic_image_height",   limit: 4
    t.string   "pic2_file_name",     limit: 255
    t.integer  "pic2_file_size",     limit: 4
    t.string   "pic2_content_type",  limit: 255
    t.datetime "pic2_updated_at"
    t.integer  "pic2_image_width",   limit: 4
    t.integer  "pic2_image_height",  limit: 4
    t.string   "cover_file_name",    limit: 255
    t.integer  "cover_file_size",    limit: 4
    t.string   "cover_content_type", limit: 255
    t.datetime "cover_updated_at"
    t.integer  "cover_image_width",  limit: 4
    t.integer  "cover_image_height", limit: 4
    t.string   "flash_file_name",    limit: 255
    t.integer  "flash_file_size",    limit: 4
    t.string   "flash_content_type", limit: 255
    t.datetime "flash_updated_at"
  end

  add_index "data_bible_categories", ["active"], name: "index_data_bible_categories_on_active", using: :btree
  add_index "data_bible_categories", ["created_at"], name: "index_data_bible_categories_on_created_at", using: :btree
  add_index "data_bible_categories", ["destroyed_at"], name: "index_data_bible_categories_on_destroyed_at", using: :btree
  add_index "data_bible_categories", ["parent_id"], name: "index_data_bible_categories_on_parent_id", using: :btree
  add_index "data_bible_categories", ["published"], name: "index_data_bible_categories_on_published", using: :btree
  add_index "data_bible_categories", ["rec"], name: "index_data_bible_categories_on_rec", using: :btree
  add_index "data_bible_categories", ["special"], name: "index_data_bible_categories_on_special", using: :btree
  add_index "data_bible_categories", ["updated_at"], name: "index_data_bible_categories_on_updated_at", using: :btree
  add_index "data_bible_categories", ["user_id"], name: "index_data_bible_categories_on_user_id", using: :btree

  create_table "data_bible_categories_readings", force: :cascade do |t|
    t.integer  "category_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",     limit: 4
    t.integer  "duration",    limit: 4
  end

  add_index "data_bible_categories_readings", ["category_id"], name: "index_data_bible_categories_readings_on_category_id", using: :btree
  add_index "data_bible_categories_readings", ["created_at"], name: "index_data_bible_categories_readings_on_created_at", using: :btree
  add_index "data_bible_categories_readings", ["updated_at"], name: "index_data_bible_categories_readings_on_updated_at", using: :btree
  add_index "data_bible_categories_readings", ["user_id"], name: "index_data_bible_categories_readings_on_user_id", using: :btree

  create_table "data_bible_images", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "article_id",        limit: 4
    t.string   "path",              limit: 255
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
    t.string   "path_info",         limit: 1000, default: "{}"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
    t.integer  "path_image_width",  limit: 4
    t.integer  "path_image_height", limit: 4
  end

  add_index "data_bible_images", ["active"], name: "index_data_bible_images_on_active", using: :btree
  add_index "data_bible_images", ["created_at"], name: "index_data_bible_images_on_created_at", using: :btree
  add_index "data_bible_images", ["destroyed_at"], name: "index_data_bible_images_on_destroyed_at", using: :btree
  add_index "data_bible_images", ["updated_at"], name: "index_data_bible_images_on_updated_at", using: :btree
  add_index "data_bible_images", ["user_id"], name: "index_data_bible_images_on_user_id", using: :btree

  create_table "data_bible_patterns", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.text     "example",      limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
  end

  add_index "data_bible_patterns", ["active"], name: "index_data_bible_patterns_on_active", using: :btree
  add_index "data_bible_patterns", ["created_at"], name: "index_data_bible_patterns_on_created_at", using: :btree
  add_index "data_bible_patterns", ["destroyed_at"], name: "index_data_bible_patterns_on_destroyed_at", using: :btree
  add_index "data_bible_patterns", ["updated_at"], name: "index_data_bible_patterns_on_updated_at", using: :btree
  add_index "data_bible_patterns", ["user_id"], name: "index_data_bible_patterns_on_user_id", using: :btree

  create_table "data_bible_videos", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "article_id",        limit: 4
    t.string   "path",              limit: 255
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
    t.string   "path_info",         limit: 1000, default: "{}"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
  end

  add_index "data_bible_videos", ["active"], name: "index_data_bible_videos_on_active", using: :btree
  add_index "data_bible_videos", ["created_at"], name: "index_data_bible_videos_on_created_at", using: :btree
  add_index "data_bible_videos", ["destroyed_at"], name: "index_data_bible_videos_on_destroyed_at", using: :btree
  add_index "data_bible_videos", ["updated_at"], name: "index_data_bible_videos_on_updated_at", using: :btree
  add_index "data_bible_videos", ["user_id"], name: "index_data_bible_videos_on_user_id", using: :btree

  create_table "data_common_countries", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_common_countries", ["active"], name: "index_data_common_countries_on_active", using: :btree
  add_index "data_common_countries", ["created_at"], name: "index_data_common_countries_on_created_at", using: :btree
  add_index "data_common_countries", ["destroyed_at"], name: "index_data_common_countries_on_destroyed_at", using: :btree
  add_index "data_common_countries", ["updated_at"], name: "index_data_common_countries_on_updated_at", using: :btree
  add_index "data_common_countries", ["user_id"], name: "index_data_common_countries_on_user_id", using: :btree

  create_table "data_common_currencies", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.float    "rate",         limit: 24
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_common_currencies", ["active"], name: "index_data_common_currencies_on_active", using: :btree
  add_index "data_common_currencies", ["created_at"], name: "index_data_common_currencies_on_created_at", using: :btree
  add_index "data_common_currencies", ["destroyed_at"], name: "index_data_common_currencies_on_destroyed_at", using: :btree
  add_index "data_common_currencies", ["updated_at"], name: "index_data_common_currencies_on_updated_at", using: :btree
  add_index "data_common_currencies", ["user_id"], name: "index_data_common_currencies_on_user_id", using: :btree

  create_table "data_common_files", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.string   "name",              limit: 255
    t.string   "path",              limit: 255
    t.text     "content",           limit: 4294967295
    t.string   "content_type",      limit: 255
    t.datetime "destroyed_at"
    t.boolean  "active",                               default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
  end

  create_table "data_editors", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "role_id",      limit: 4
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.datetime "destroyed_at"
  end

  add_index "data_editors", ["active"], name: "index_data_editors_on_active", using: :btree
  add_index "data_editors", ["created_at"], name: "index_data_editors_on_created_at", using: :btree
  add_index "data_editors", ["destroyed_at"], name: "index_data_editors_on_destroyed_at", using: :btree
  add_index "data_editors", ["role_id"], name: "index_data_editors_on_role_id", using: :btree
  add_index "data_editors", ["updated_at"], name: "index_data_editors_on_updated_at", using: :btree
  add_index "data_editors", ["user_id"], name: "index_data_editors_on_user_id", using: :btree

  create_table "data_news_articles", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.string   "name",               limit: 255
    t.integer  "category_id",        limit: 4
    t.integer  "pattern_id",         limit: 4
    t.text     "content",            limit: 65535
    t.boolean  "published",                        default: false
    t.boolean  "active",                           default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "rec_home",                         default: false
    t.boolean  "rec_index",                        default: false
    t.datetime "destroyed_at"
    t.string   "cover",              limit: 255
    t.string   "website",            limit: 255
    t.string   "cover_info",         limit: 1000,  default: "{}"
    t.string   "cover_file_name",    limit: 255
    t.integer  "cover_file_size",    limit: 4
    t.string   "cover_content_type", limit: 255
    t.datetime "cover_updated_at"
    t.integer  "cover_image_width",  limit: 4
    t.integer  "cover_image_height", limit: 4
  end

  add_index "data_news_articles", ["active"], name: "index_data_news_articles_on_active", using: :btree
  add_index "data_news_articles", ["category_id"], name: "index_data_news_articles_on_category_id", using: :btree
  add_index "data_news_articles", ["created_at"], name: "index_data_news_articles_on_created_at", using: :btree
  add_index "data_news_articles", ["destroyed_at"], name: "index_data_news_articles_on_destroyed_at", using: :btree
  add_index "data_news_articles", ["pattern_id"], name: "index_data_news_articles_on_pattern_id", using: :btree
  add_index "data_news_articles", ["published"], name: "index_data_news_articles_on_published", using: :btree
  add_index "data_news_articles", ["rec_home"], name: "index_data_news_articles_on_rec_home", using: :btree
  add_index "data_news_articles", ["rec_index"], name: "index_data_news_articles_on_rec_index", using: :btree
  add_index "data_news_articles", ["updated_at"], name: "index_data_news_articles_on_updated_at", using: :btree
  add_index "data_news_articles", ["user_id"], name: "index_data_news_articles_on_user_id", using: :btree

  create_table "data_news_articles_brands", force: :cascade do |t|
    t.integer  "article_id",   limit: 4
    t.integer  "brand_id",     limit: 4
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_news_articles_brands", ["active"], name: "index_data_news_articles_brands_on_active", using: :btree
  add_index "data_news_articles_brands", ["article_id"], name: "index_data_news_articles_brands_on_article_id", using: :btree
  add_index "data_news_articles_brands", ["brand_id"], name: "index_data_news_articles_brands_on_brand_id", using: :btree
  add_index "data_news_articles_brands", ["created_at"], name: "index_data_news_articles_brands_on_created_at", using: :btree
  add_index "data_news_articles_brands", ["destroyed_at"], name: "index_data_news_articles_brands_on_destroyed_at", using: :btree
  add_index "data_news_articles_brands", ["updated_at"], name: "index_data_news_articles_brands_on_updated_at", using: :btree

  create_table "data_news_articles_people", force: :cascade do |t|
    t.integer  "article_id",   limit: 4
    t.integer  "person_id",    limit: 4
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_news_articles_people", ["active"], name: "index_data_news_articles_people_on_active", using: :btree
  add_index "data_news_articles_people", ["article_id"], name: "index_data_news_articles_people_on_article_id", using: :btree
  add_index "data_news_articles_people", ["created_at"], name: "index_data_news_articles_people_on_created_at", using: :btree
  add_index "data_news_articles_people", ["destroyed_at"], name: "index_data_news_articles_people_on_destroyed_at", using: :btree
  add_index "data_news_articles_people", ["person_id"], name: "index_data_news_articles_people_on_person_id", using: :btree
  add_index "data_news_articles_people", ["updated_at"], name: "index_data_news_articles_people_on_updated_at", using: :btree

  create_table "data_news_articles_readings", force: :cascade do |t|
    t.integer  "article_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_news_articles_readings", ["article_id"], name: "index_data_news_articles_readings_on_article_id", using: :btree
  add_index "data_news_articles_readings", ["created_at"], name: "index_data_news_articles_readings_on_created_at", using: :btree
  add_index "data_news_articles_readings", ["updated_at"], name: "index_data_news_articles_readings_on_updated_at", using: :btree
  add_index "data_news_articles_readings", ["user_id"], name: "index_data_news_articles_readings_on_user_id", using: :btree

  create_table "data_news_audios", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "article_id",        limit: 4
    t.string   "path",              limit: 255
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
    t.string   "path_info",         limit: 1000, default: "{}"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
  end

  add_index "data_news_audios", ["active"], name: "index_data_news_audios_on_active", using: :btree
  add_index "data_news_audios", ["created_at"], name: "index_data_news_audios_on_created_at", using: :btree
  add_index "data_news_audios", ["destroyed_at"], name: "index_data_news_audios_on_destroyed_at", using: :btree
  add_index "data_news_audios", ["updated_at"], name: "index_data_news_audios_on_updated_at", using: :btree
  add_index "data_news_audios", ["user_id"], name: "index_data_news_audios_on_user_id", using: :btree

  create_table "data_news_categories", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "parent_id",    limit: 4
    t.string   "name",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
  end

  add_index "data_news_categories", ["active"], name: "index_data_news_categories_on_active", using: :btree
  add_index "data_news_categories", ["created_at"], name: "index_data_news_categories_on_created_at", using: :btree
  add_index "data_news_categories", ["destroyed_at"], name: "index_data_news_categories_on_destroyed_at", using: :btree
  add_index "data_news_categories", ["parent_id"], name: "index_data_news_categories_on_parent_id", using: :btree
  add_index "data_news_categories", ["updated_at"], name: "index_data_news_categories_on_updated_at", using: :btree
  add_index "data_news_categories", ["user_id"], name: "index_data_news_categories_on_user_id", using: :btree

  create_table "data_news_images", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "article_id",        limit: 4
    t.string   "path",              limit: 255
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
    t.string   "path_info",         limit: 1000, default: "{}"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
    t.integer  "path_image_width",  limit: 4
    t.integer  "path_image_height", limit: 4
  end

  add_index "data_news_images", ["active"], name: "index_data_news_images_on_active", using: :btree
  add_index "data_news_images", ["created_at"], name: "index_data_news_images_on_created_at", using: :btree
  add_index "data_news_images", ["destroyed_at"], name: "index_data_news_images_on_destroyed_at", using: :btree
  add_index "data_news_images", ["updated_at"], name: "index_data_news_images_on_updated_at", using: :btree
  add_index "data_news_images", ["user_id"], name: "index_data_news_images_on_user_id", using: :btree

  create_table "data_news_patterns", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.text     "example",      limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
  end

  add_index "data_news_patterns", ["active"], name: "index_data_news_patterns_on_active", using: :btree
  add_index "data_news_patterns", ["created_at"], name: "index_data_news_patterns_on_created_at", using: :btree
  add_index "data_news_patterns", ["destroyed_at"], name: "index_data_news_patterns_on_destroyed_at", using: :btree
  add_index "data_news_patterns", ["updated_at"], name: "index_data_news_patterns_on_updated_at", using: :btree
  add_index "data_news_patterns", ["user_id"], name: "index_data_news_patterns_on_user_id", using: :btree

  create_table "data_news_people", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "chinese",      limit: 255
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_news_people", ["active"], name: "index_data_news_people_on_active", using: :btree
  add_index "data_news_people", ["created_at"], name: "index_data_news_people_on_created_at", using: :btree
  add_index "data_news_people", ["destroyed_at"], name: "index_data_news_people_on_destroyed_at", using: :btree
  add_index "data_news_people", ["updated_at"], name: "index_data_news_people_on_updated_at", using: :btree
  add_index "data_news_people", ["user_id"], name: "index_data_news_people_on_user_id", using: :btree

  create_table "data_news_videos", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "article_id",        limit: 4
    t.string   "path",              limit: 255
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
    t.string   "path_info",         limit: 1000, default: "{}"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
  end

  add_index "data_news_videos", ["active"], name: "index_data_news_videos_on_active", using: :btree
  add_index "data_news_videos", ["created_at"], name: "index_data_news_videos_on_created_at", using: :btree
  add_index "data_news_videos", ["destroyed_at"], name: "index_data_news_videos_on_destroyed_at", using: :btree
  add_index "data_news_videos", ["updated_at"], name: "index_data_news_videos_on_updated_at", using: :btree
  add_index "data_news_videos", ["user_id"], name: "index_data_news_videos_on_user_id", using: :btree

  create_table "data_product_articles", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "category1_id",      limit: 4
    t.integer  "category2_id",      limit: 4
    t.integer  "image_id",          limit: 4
    t.string   "brand_ids",         limit: 255
    t.boolean  "rec_home",                                       default: false
    t.boolean  "rec_index",                                      default: false
    t.string   "name",              limit: 255
    t.string   "title",             limit: 255
    t.string   "keyword",           limit: 255
    t.text     "intro",             limit: 65535
    t.text     "content",           limit: 65535
    t.text     "feature",           limit: 65535
    t.text     "style",             limit: 65535
    t.text     "appropriate_crowd", limit: 65535
    t.boolean  "active",                                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.decimal  "price",                           precision: 10
    t.string   "website",           limit: 255
    t.boolean  "published",                                      default: false
    t.datetime "destroyed_at"
    t.string   "currency",          limit: 255
    t.text     "reason",            limit: 65535
  end

  add_index "data_product_articles", ["active", "published", "rec_index", "created_at"], name: "by_rec_index_and_created_at", using: :btree
  add_index "data_product_articles", ["active"], name: "index_data_product_articles_on_active", using: :btree
  add_index "data_product_articles", ["category1_id"], name: "index_data_product_articles_on_category1_id", using: :btree
  add_index "data_product_articles", ["category2_id"], name: "index_data_product_articles_on_category2_id", using: :btree
  add_index "data_product_articles", ["created_at"], name: "index_data_product_articles_on_created_at", using: :btree
  add_index "data_product_articles", ["destroyed_at"], name: "index_data_product_articles_on_destroyed_at", using: :btree
  add_index "data_product_articles", ["image_id"], name: "index_data_product_articles_on_image_id", using: :btree
  add_index "data_product_articles", ["published"], name: "index_data_product_articles_on_published", using: :btree
  add_index "data_product_articles", ["rec_home"], name: "index_data_product_articles_on_rec_home", using: :btree
  add_index "data_product_articles", ["rec_index"], name: "index_data_product_articles_on_rec_index", using: :btree
  add_index "data_product_articles", ["updated_at"], name: "index_data_product_articles_on_updated_at", using: :btree
  add_index "data_product_articles", ["user_id"], name: "index_data_product_articles_on_user_id", using: :btree

  create_table "data_product_articles_readings", force: :cascade do |t|
    t.integer  "article_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_product_articles_readings", ["article_id"], name: "index_data_product_articles_readings_on_article_id", using: :btree
  add_index "data_product_articles_readings", ["created_at"], name: "index_data_product_articles_readings_on_created_at", using: :btree
  add_index "data_product_articles_readings", ["updated_at"], name: "index_data_product_articles_readings_on_updated_at", using: :btree
  add_index "data_product_articles_readings", ["user_id"], name: "index_data_product_articles_readings_on_user_id", using: :btree

  create_table "data_product_brands", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.string   "chinese",           limit: 255
    t.string   "abbreviation",      limit: 255
    t.string   "pic",               limit: 255
    t.boolean  "active",                          default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",           limit: 4
    t.datetime "destroyed_at"
    t.string   "pic_info",          limit: 1000,  default: "{}"
    t.boolean  "published",                       default: false
    t.string   "pic2",              limit: 255
    t.string   "pic3",              limit: 255
    t.string   "website",           limit: 255
    t.text     "description",       limit: 65535
    t.integer  "order",             limit: 4,     default: 1
    t.string   "recommend",         limit: 255
    t.string   "swf",               limit: 255
    t.string   "pic_file_name",     limit: 255
    t.integer  "pic_file_size",     limit: 4
    t.string   "pic_content_type",  limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",   limit: 4
    t.integer  "pic_image_height",  limit: 4
    t.string   "pic2_file_name",    limit: 255
    t.integer  "pic2_file_size",    limit: 4
    t.string   "pic2_content_type", limit: 255
    t.datetime "pic2_updated_at"
    t.integer  "pic2_image_width",  limit: 4
    t.integer  "pic2_image_height", limit: 4
    t.string   "pic3_file_name",    limit: 255
    t.integer  "pic3_file_size",    limit: 4
    t.string   "pic3_content_type", limit: 255
    t.datetime "pic3_updated_at"
    t.integer  "pic3_image_width",  limit: 4
    t.integer  "pic3_image_height", limit: 4
    t.string   "swf_file_name",     limit: 255
    t.integer  "swf_file_size",     limit: 4
    t.string   "swf_content_type",  limit: 255
    t.datetime "swf_updated_at"
  end

  add_index "data_product_brands", ["created_at"], name: "index_data_product_brands_on_created_at", using: :btree
  add_index "data_product_brands", ["destroyed_at"], name: "index_data_product_brands_on_destroyed_at", using: :btree
  add_index "data_product_brands", ["updated_at"], name: "index_data_product_brands_on_updated_at", using: :btree
  add_index "data_product_brands", ["user_id"], name: "index_data_product_brands_on_user_id", using: :btree

  create_table "data_product_categories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "parent_id",    limit: 4
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.datetime "destroyed_at"
  end

  add_index "data_product_categories", ["active"], name: "index_data_product_categories_on_active", using: :btree
  add_index "data_product_categories", ["created_at"], name: "index_data_product_categories_on_created_at", using: :btree
  add_index "data_product_categories", ["destroyed_at"], name: "index_data_product_categories_on_destroyed_at", using: :btree
  add_index "data_product_categories", ["parent_id"], name: "index_data_product_categories_on_parent_id", using: :btree
  add_index "data_product_categories", ["updated_at"], name: "index_data_product_categories_on_updated_at", using: :btree
  add_index "data_product_categories", ["user_id"], name: "index_data_product_categories_on_user_id", using: :btree

  create_table "data_product_crowds", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.datetime "destroyed_at"
  end

  add_index "data_product_crowds", ["active"], name: "index_data_product_crowds_on_active", using: :btree
  add_index "data_product_crowds", ["created_at"], name: "index_data_product_crowds_on_created_at", using: :btree
  add_index "data_product_crowds", ["destroyed_at"], name: "index_data_product_crowds_on_destroyed_at", using: :btree
  add_index "data_product_crowds", ["updated_at"], name: "index_data_product_crowds_on_updated_at", using: :btree
  add_index "data_product_crowds", ["user_id"], name: "index_data_product_crowds_on_user_id", using: :btree

  create_table "data_product_images", force: :cascade do |t|
    t.integer  "article_id",        limit: 4
    t.string   "pic1",              limit: 255
    t.string   "pic2",              limit: 255
    t.boolean  "active",                         default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",           limit: 4
    t.datetime "destroyed_at"
    t.string   "pic1_info",         limit: 1000, default: "{}"
    t.string   "pic2_info",         limit: 1000, default: "{}"
    t.string   "small_info",        limit: 1000, default: "{}"
    t.string   "pic1_file_name",    limit: 255
    t.integer  "pic1_file_size",    limit: 4
    t.string   "pic1_content_type", limit: 255
    t.datetime "pic1_updated_at"
    t.integer  "pic1_image_width",  limit: 4
    t.integer  "pic1_image_height", limit: 4
    t.string   "pic2_file_name",    limit: 255
    t.integer  "pic2_file_size",    limit: 4
    t.string   "pic2_content_type", limit: 255
    t.datetime "pic2_updated_at"
    t.integer  "pic2_image_width",  limit: 4
    t.integer  "pic2_image_height", limit: 4
  end

  add_index "data_product_images", ["active"], name: "index_data_product_images_on_active", using: :btree
  add_index "data_product_images", ["article_id"], name: "index_data_product_images_on_article_id", using: :btree
  add_index "data_product_images", ["created_at"], name: "index_data_product_images_on_created_at", using: :btree
  add_index "data_product_images", ["destroyed_at"], name: "index_data_product_images_on_destroyed_at", using: :btree
  add_index "data_product_images", ["updated_at"], name: "index_data_product_images_on_updated_at", using: :btree
  add_index "data_product_images", ["user_id"], name: "index_data_product_images_on_user_id", using: :btree

  create_table "data_product_occasions", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.boolean  "active",                   default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",      limit: 4
    t.datetime "destroyed_at"
  end

  add_index "data_product_occasions", ["active"], name: "index_data_product_occasions_on_active", using: :btree
  add_index "data_product_occasions", ["created_at"], name: "index_data_product_occasions_on_created_at", using: :btree
  add_index "data_product_occasions", ["destroyed_at"], name: "index_data_product_occasions_on_destroyed_at", using: :btree
  add_index "data_product_occasions", ["updated_at"], name: "index_data_product_occasions_on_updated_at", using: :btree
  add_index "data_product_occasions", ["user_id"], name: "index_data_product_occasions_on_user_id", using: :btree

  create_table "data_roles", force: :cascade do |t|
    t.string   "name",                     limit: 255
    t.text     "description",              limit: 65535
    t.boolean  "active",                                 default: true
    t.boolean  "show_editor"
    t.boolean  "create_editor"
    t.boolean  "update_editor"
    t.boolean  "destroy_editor"
    t.boolean  "show_role"
    t.boolean  "create_role"
    t.boolean  "update_role"
    t.boolean  "destroy_role"
    t.boolean  "show_product_article"
    t.boolean  "create_product_article"
    t.boolean  "update_product_article"
    t.boolean  "destroy_product_article"
    t.boolean  "show_product_category"
    t.boolean  "create_product_category"
    t.boolean  "update_product_category"
    t.boolean  "destroy_product_category"
    t.boolean  "show_product_brand"
    t.boolean  "create_product_brand"
    t.boolean  "update_product_brand"
    t.boolean  "destroy_product_brand"
    t.boolean  "show_product_crowd"
    t.boolean  "create_product_crowd"
    t.boolean  "update_product_crowd"
    t.boolean  "destroy_product_crowd"
    t.boolean  "show_product_occasion"
    t.boolean  "create_product_occasion"
    t.boolean  "update_product_occasion"
    t.boolean  "destroy_product_occasion"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",                  limit: 4
    t.boolean  "show_bible_article"
    t.boolean  "update_bible_article"
    t.boolean  "create_bible_article"
    t.boolean  "destroy_bible_article"
    t.boolean  "show_bible_pattern"
    t.boolean  "update_bible_pattern"
    t.boolean  "create_bible_pattern"
    t.boolean  "destroy_bible_pattern"
    t.boolean  "show_bible_category"
    t.boolean  "update_bible_category"
    t.boolean  "create_bible_category"
    t.boolean  "destroy_bible_category"
    t.boolean  "show_news_article"
    t.boolean  "update_news_article"
    t.boolean  "create_news_article"
    t.boolean  "destroy_news_article"
    t.boolean  "show_news_pattern"
    t.boolean  "update_news_pattern"
    t.boolean  "create_news_pattern"
    t.boolean  "destroy_news_pattern"
    t.boolean  "show_news_category"
    t.boolean  "update_news_category"
    t.boolean  "create_news_category"
    t.boolean  "destroy_news_category"
    t.datetime "destroyed_at"
    t.boolean  "show_uzine_magazine"
    t.boolean  "update_uzine_magazine"
    t.boolean  "create_uzine_magazine"
    t.boolean  "destroy_uzine_magazine"
    t.boolean  "show_uzine_page"
    t.boolean  "update_uzine_page"
    t.boolean  "create_uzine_page"
    t.boolean  "destroy_uzine_page"
    t.boolean  "show_common_country"
    t.boolean  "update_common_country"
    t.boolean  "create_common_country"
    t.boolean  "destroy_common_country"
    t.boolean  "show_common_currency"
    t.boolean  "update_common_currency"
    t.boolean  "create_common_currency"
    t.boolean  "destroy_common_currency"
    t.boolean  "show_news_person"
    t.boolean  "update_news_person"
    t.boolean  "create_news_person"
    t.boolean  "destroy_news_person"
    t.boolean  "show_contribute_note"
    t.boolean  "update_contribute_note"
    t.boolean  "show_common_file"
    t.boolean  "update_common_file"
    t.boolean  "create_common_file"
    t.boolean  "destroy_common_file"
    t.boolean  "manage_common_file"
    t.boolean  "manage_editor"
    t.boolean  "manage_role"
    t.boolean  "manage_product_article"
    t.boolean  "manage_product_category"
    t.boolean  "manage_product_brand"
    t.boolean  "manage_product_crowd"
    t.boolean  "manage_product_occasion"
    t.boolean  "manage_bible_article"
    t.boolean  "manage_bible_pattern"
    t.boolean  "manage_bible_category"
    t.boolean  "manage_news_article"
    t.boolean  "manage_news_pattern"
    t.boolean  "manage_news_category"
    t.boolean  "manage_uzine_magazine"
    t.boolean  "manage_uzine_page"
    t.boolean  "manage_common_country"
    t.boolean  "manage_common_currency"
    t.boolean  "manage_news_person"
    t.boolean  "create_contribute_note"
    t.boolean  "destroy_contribute_note"
    t.boolean  "manage_contribute_note"
  end

  add_index "data_roles", ["active"], name: "index_data_roles_on_active", using: :btree
  add_index "data_roles", ["created_at"], name: "index_data_roles_on_created_at", using: :btree
  add_index "data_roles", ["destroyed_at"], name: "index_data_roles_on_destroyed_at", using: :btree
  add_index "data_roles", ["updated_at"], name: "index_data_roles_on_updated_at", using: :btree
  add_index "data_roles", ["user_id"], name: "index_data_roles_on_user_id", using: :btree

  create_table "data_users", force: :cascade do |t|
    t.string   "pic",          limit: 255
    t.string   "name",         limit: 20
    t.string   "sex",          limit: 20
    t.date     "birthday"
    t.text     "friend_ids",   limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "destroyed_at"
  end

  add_index "data_users", ["birthday"], name: "index_data_users_on_birthday", using: :btree
  add_index "data_users", ["created_at"], name: "index_data_users_on_created_at", using: :btree
  add_index "data_users", ["destroyed_at"], name: "index_data_users_on_destroyed_at", using: :btree
  add_index "data_users", ["id"], name: "index_data_users_on_id", using: :btree
  add_index "data_users", ["login_at"], name: "index_data_users_on_login_at", using: :btree
  add_index "data_users", ["updated_at"], name: "index_data_users_on_updated_at", using: :btree

  create_table "data_uzine_audios", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "page_id",           limit: 4
    t.string   "path",              limit: 255
    t.string   "title",             limit: 255
    t.text     "description",       limit: 65535
    t.boolean  "active",                          default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",              limit: 255
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
  end

  add_index "data_uzine_audios", ["active"], name: "index_data_uzine_audios_on_active", using: :btree
  add_index "data_uzine_audios", ["created_at"], name: "index_data_uzine_audios_on_created_at", using: :btree
  add_index "data_uzine_audios", ["destroyed_at"], name: "index_data_uzine_audios_on_destroyed_at", using: :btree
  add_index "data_uzine_audios", ["updated_at"], name: "index_data_uzine_audios_on_updated_at", using: :btree
  add_index "data_uzine_audios", ["user_id"], name: "index_data_uzine_audios_on_user_id", using: :btree

  create_table "data_uzine_images", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "page_id",           limit: 4
    t.string   "path",              limit: 255
    t.string   "title",             limit: 255
    t.text     "description",       limit: 65535
    t.boolean  "active",                          default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "small",             limit: 255
    t.string   "name",              limit: 255
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
    t.integer  "path_image_width",  limit: 4
    t.integer  "path_image_height", limit: 4
  end

  add_index "data_uzine_images", ["active"], name: "index_data_uzine_images_on_active", using: :btree
  add_index "data_uzine_images", ["created_at"], name: "index_data_uzine_images_on_created_at", using: :btree
  add_index "data_uzine_images", ["destroyed_at"], name: "index_data_uzine_images_on_destroyed_at", using: :btree
  add_index "data_uzine_images", ["updated_at"], name: "index_data_uzine_images_on_updated_at", using: :btree
  add_index "data_uzine_images", ["user_id"], name: "index_data_uzine_images_on_user_id", using: :btree

  create_table "data_uzine_magazines", force: :cascade do |t|
    t.integer  "user_id",          limit: 4
    t.string   "name",             limit: 255
    t.string   "title",            limit: 255
    t.text     "description",      limit: 65535
    t.string   "tag",              limit: 255
    t.string   "pic",              limit: 255
    t.boolean  "published",                      default: false
    t.boolean  "active",                         default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cover_color",      limit: 255
    t.string   "title_color",      limit: 255
    t.string   "content_color",    limit: 255
    t.string   "pic_info",         limit: 1000,  default: "{}"
    t.string   "pic_file_name",    limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.string   "pic_content_type", limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
  end

  add_index "data_uzine_magazines", ["active"], name: "index_data_uzine_magazines_on_active", using: :btree
  add_index "data_uzine_magazines", ["created_at"], name: "index_data_uzine_magazines_on_created_at", using: :btree
  add_index "data_uzine_magazines", ["destroyed_at"], name: "index_data_uzine_magazines_on_destroyed_at", using: :btree
  add_index "data_uzine_magazines", ["published"], name: "index_data_uzine_magazines_on_published", using: :btree
  add_index "data_uzine_magazines", ["updated_at"], name: "index_data_uzine_magazines_on_updated_at", using: :btree
  add_index "data_uzine_magazines", ["user_id"], name: "index_data_uzine_magazines_on_user_id", using: :btree

  create_table "data_uzine_magazines_readings", force: :cascade do |t|
    t.integer  "magazine_id", limit: 4
    t.integer  "user_id",     limit: 4
    t.integer  "duration",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_uzine_magazines_readings", ["created_at"], name: "index_data_uzine_magazines_readings_on_created_at", using: :btree
  add_index "data_uzine_magazines_readings", ["magazine_id"], name: "index_data_uzine_magazines_readings_on_magazine_id", using: :btree
  add_index "data_uzine_magazines_readings", ["updated_at"], name: "index_data_uzine_magazines_readings_on_updated_at", using: :btree
  add_index "data_uzine_magazines_readings", ["user_id"], name: "index_data_uzine_magazines_readings_on_user_id", using: :btree

  create_table "data_uzine_pages", force: :cascade do |t|
    t.integer  "user_id",            limit: 4
    t.integer  "magazine_id",        limit: 4
    t.integer  "order",              limit: 4,     default: 1
    t.string   "title",              limit: 255
    t.string   "column",             limit: 255
    t.string   "pic",                limit: 255
    t.string   "flash",              limit: 255
    t.boolean  "published",                        default: false
    t.boolean  "active",                           default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "height",             limit: 4
    t.integer  "index",              limit: 4
    t.text     "content",            limit: 65535
    t.string   "icon",               limit: 255
    t.string   "fla",                limit: 255
    t.string   "pic_info",           limit: 1000,  default: "{}"
    t.string   "icon_info",          limit: 1000,  default: "{}"
    t.string   "flash_info",         limit: 1000,  default: "{}"
    t.string   "fla_info",           limit: 1000,  default: "{}"
    t.string   "pic_file_name",      limit: 255
    t.integer  "pic_file_size",      limit: 4
    t.string   "pic_content_type",   limit: 255
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",    limit: 4
    t.integer  "pic_image_height",   limit: 4
    t.string   "fla_file_name",      limit: 255
    t.integer  "fla_file_size",      limit: 4
    t.string   "fla_content_type",   limit: 255
    t.datetime "fla_updated_at"
    t.string   "flash_file_name",    limit: 255
    t.integer  "flash_file_size",    limit: 4
    t.string   "flash_content_type", limit: 255
    t.datetime "flash_updated_at"
    t.string   "icon_file_name",     limit: 255
    t.integer  "icon_file_size",     limit: 4
    t.string   "icon_content_type",  limit: 255
    t.datetime "icon_updated_at"
    t.integer  "icon_image_width",   limit: 4
    t.integer  "icon_image_height",  limit: 4
  end

  add_index "data_uzine_pages", ["active"], name: "index_data_uzine_pages_on_active", using: :btree
  add_index "data_uzine_pages", ["created_at"], name: "index_data_uzine_pages_on_created_at", using: :btree
  add_index "data_uzine_pages", ["destroyed_at"], name: "index_data_uzine_pages_on_destroyed_at", using: :btree
  add_index "data_uzine_pages", ["magazine_id"], name: "index_data_uzine_pages_on_magazine_id", using: :btree
  add_index "data_uzine_pages", ["published"], name: "index_data_uzine_pages_on_published", using: :btree
  add_index "data_uzine_pages", ["updated_at"], name: "index_data_uzine_pages_on_updated_at", using: :btree
  add_index "data_uzine_pages", ["user_id"], name: "index_data_uzine_pages_on_user_id", using: :btree

  create_table "data_uzine_pages_readings", force: :cascade do |t|
    t.integer  "page_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "data_uzine_pages_readings", ["created_at"], name: "index_data_uzine_pages_readings_on_created_at", using: :btree
  add_index "data_uzine_pages_readings", ["page_id"], name: "index_data_uzine_pages_readings_on_page_id", using: :btree
  add_index "data_uzine_pages_readings", ["updated_at"], name: "index_data_uzine_pages_readings_on_updated_at", using: :btree
  add_index "data_uzine_pages_readings", ["user_id"], name: "index_data_uzine_pages_readings_on_user_id", using: :btree

  create_table "data_uzine_popups", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "page_id",           limit: 4
    t.string   "path",              limit: 255
    t.string   "title",             limit: 255
    t.text     "description",       limit: 65535
    t.boolean  "active",                          default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",              limit: 255
    t.string   "path_info",         limit: 1000,  default: "{}"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
  end

  add_index "data_uzine_popups", ["active"], name: "index_data_uzine_popups_on_active", using: :btree
  add_index "data_uzine_popups", ["created_at"], name: "index_data_uzine_popups_on_created_at", using: :btree
  add_index "data_uzine_popups", ["destroyed_at"], name: "index_data_uzine_popups_on_destroyed_at", using: :btree
  add_index "data_uzine_popups", ["page_id"], name: "index_data_uzine_popups_on_page_id", using: :btree
  add_index "data_uzine_popups", ["updated_at"], name: "index_data_uzine_popups_on_updated_at", using: :btree
  add_index "data_uzine_popups", ["user_id"], name: "index_data_uzine_popups_on_user_id", using: :btree

  create_table "data_uzine_texts", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "page_id",      limit: 4
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",         limit: 255
  end

  add_index "data_uzine_texts", ["active"], name: "index_data_uzine_texts_on_active", using: :btree
  add_index "data_uzine_texts", ["created_at"], name: "index_data_uzine_texts_on_created_at", using: :btree
  add_index "data_uzine_texts", ["destroyed_at"], name: "index_data_uzine_texts_on_destroyed_at", using: :btree
  add_index "data_uzine_texts", ["page_id"], name: "index_data_uzine_texts_on_page_id", using: :btree
  add_index "data_uzine_texts", ["updated_at"], name: "index_data_uzine_texts_on_updated_at", using: :btree
  add_index "data_uzine_texts", ["user_id"], name: "index_data_uzine_texts_on_user_id", using: :btree

  create_table "data_uzine_videos", force: :cascade do |t|
    t.integer  "user_id",           limit: 4
    t.integer  "page_id",           limit: 4
    t.string   "path",              limit: 255
    t.string   "title",             limit: 255
    t.text     "description",       limit: 65535
    t.boolean  "active",                          default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name",              limit: 255
    t.string   "path_info",         limit: 1000,  default: "{}"
    t.string   "path_file_name",    limit: 255
    t.integer  "path_file_size",    limit: 4
    t.string   "path_content_type", limit: 255
    t.datetime "path_updated_at"
  end

  add_index "data_uzine_videos", ["active"], name: "index_data_uzine_videos_on_active", using: :btree
  add_index "data_uzine_videos", ["created_at"], name: "index_data_uzine_videos_on_created_at", using: :btree
  add_index "data_uzine_videos", ["destroyed_at"], name: "index_data_uzine_videos_on_destroyed_at", using: :btree
  add_index "data_uzine_videos", ["updated_at"], name: "index_data_uzine_videos_on_updated_at", using: :btree
  add_index "data_uzine_videos", ["user_id"], name: "index_data_uzine_videos_on_user_id", using: :btree

  create_table "dataset_zips", force: :cascade do |t|
    t.string  "mongo_id",   limit: 255
    t.string  "url",        limit: 255, default: ""
    t.string  "content",    limit: 255, default: ""
    t.integer "duration",   limit: 4,   default: 0
    t.integer "left_at",    limit: 4,   default: 0
    t.integer "created_at", limit: 4,   default: 0
    t.integer "user_id",    limit: 4,   default: 0
    t.string  "refer_url",  limit: 255, default: ""
    t.integer "client_ip",  limit: 4,   default: 0
    t.integer "session_at", limit: 4,   default: 0
    t.string  "visitor_id", limit: 255, default: ""
    t.integer "link_id",    limit: 4,   default: 0
    t.string  "cid",        limit: 255, default: ""
    t.integer "treat_at",   limit: 4,   default: 0
    t.string  "host",       limit: 255, default: ""
    t.string  "subapp",     limit: 255, default: ""
    t.string  "popup",      limit: 255, default: ""
    t.integer "product_id", limit: 4,   default: 0
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   limit: 4,     default: 0
    t.integer  "attempts",   limit: 4,     default: 0
    t.text     "handler",    limit: 65535
    t.string   "last_error", limit: 255
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by",  limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "delayed_jobs", ["locked_by"], name: "index_delayed_jobs_on_locked_by", using: :btree

  create_table "develop_document_editors", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "role_id",      limit: 4
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "develop_document_pages", force: :cascade do |t|
    t.string   "uri",              limit: 255
    t.string   "klass",            limit: 255
    t.string   "name",             limit: 255
    t.text     "description",      limit: 65535
    t.text     "method",           limit: 4294967295
    t.datetime "last_modified_at"
    t.boolean  "active",                              default: true, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "develop_document_roles", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.string   "rule",         limit: 255
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "permission",   limit: 255
  end

  create_table "develop_users", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "sex",          limit: 255
    t.string   "pic",          limit: 255
    t.datetime "birthday"
    t.text     "friend_ids",   limit: 65535
    t.datetime "login_at"
    t.integer  "lock_version", limit: 4,     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices", force: :cascade do |t|
    t.string   "device_type", limit: 255
    t.string   "os_version",  limit: 255
    t.string   "token",       limit: 255
    t.boolean  "push_enable"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "devices_users", force: :cascade do |t|
    t.integer  "device_id",  limit: 4
    t.integer  "user_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "edm_mail_trade_reports", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "groupon_coupons", force: :cascade do |t|
    t.string   "name",          limit: 100,                                  null: false
    t.text     "description",   limit: 65535
    t.integer  "product_id",    limit: 4,                                    null: false
    t.decimal  "price",                       precision: 10
    t.decimal  "discount",                    precision: 10,                 null: false
    t.integer  "minimum",       limit: 4,                                    null: false
    t.boolean  "published",                                  default: false
    t.integer  "expired_after", limit: 4
    t.datetime "deleted_at"
    t.integer  "lock_version",  limit: 4,                    default: 0
    t.integer  "creator_id",    limit: 4
    t.integer  "updater_id",    limit: 4
    t.datetime "created_at",                                                 null: false
    t.datetime "updated_at",                                                 null: false
    t.integer  "position",      limit: 4
    t.boolean  "rebuy_allowed",                              default: true
    t.boolean  "listable",                                   default: true
    t.boolean  "is_redpack",                                 default: false
  end

  add_index "groupon_coupons", ["deleted_at"], name: "index_groupon_coupons_on_deleted_at", using: :btree
  add_index "groupon_coupons", ["product_id"], name: "index_groupon_coupons_on_product_id", using: :btree

  create_table "groupon_coupons_updatings", force: :cascade do |t|
    t.integer  "coupon_id",    limit: 4
    t.integer  "discount",     limit: 4
    t.integer  "lock_version", limit: 4, default: 0
    t.integer  "editor_id",    limit: 4
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "groupon_coupons_updatings", ["coupon_id"], name: "index_groupon_coupons_updatings_on_coupon_id", using: :btree

  create_table "groupon_group_trades", force: :cascade do |t|
    t.integer  "group_id",          limit: 4
    t.integer  "trade_id",          limit: 4
    t.integer  "user_id",           limit: 4
    t.datetime "receipted_at"
    t.integer  "lock_version",      limit: 4,     default: 0
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
    t.string   "refund_status",     limit: 255
    t.string   "refund_identifier", limit: 255
    t.text     "refund_return",     limit: 65535
    t.datetime "refund_at"
  end

  add_index "groupon_group_trades", ["group_id"], name: "index_groupon_group_trades_on_group_id", using: :btree
  add_index "groupon_group_trades", ["trade_id"], name: "index_groupon_group_trades_on_trade_id", using: :btree
  add_index "groupon_group_trades", ["user_id"], name: "index_groupon_group_trades_on_user_id", using: :btree

  create_table "groupon_groups", force: :cascade do |t|
    t.integer  "coupon_id",    limit: 4,                              null: false
    t.integer  "user_id",      limit: 4,                              null: false
    t.decimal  "discount",                 precision: 10,             null: false
    t.datetime "expired_at"
    t.integer  "minimum",      limit: 4
    t.integer  "current",      limit: 4
    t.string   "status",       limit: 255
    t.datetime "deleted_at"
    t.integer  "lock_version", limit: 4,                  default: 0
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
  end

  add_index "groupon_groups", ["coupon_id"], name: "index_groupon_groups_on_coupon_id", using: :btree
  add_index "groupon_groups", ["deleted_at"], name: "index_groupon_groups_on_deleted_at", using: :btree
  add_index "groupon_groups", ["expired_at"], name: "index_groupon_groups_on_expired_at", using: :btree
  add_index "groupon_groups", ["user_id"], name: "index_groupon_groups_on_user_id", using: :btree

  create_table "hot_products", force: :cascade do |t|
    t.datetime "date_config"
    t.text     "product_ids", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manage_editors", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.string   "name",          limit: 255
    t.integer  "role_id",       limit: 4
    t.boolean  "active",                    default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "lock_version",  limit: 4,   default: 0
    t.string   "department",    limit: 255
    t.integer  "supervisor_id", limit: 4
    t.integer  "shop_id",       limit: 4
    t.integer  "percent",       limit: 4
    t.string   "identifier",    limit: 255
  end

  add_index "manage_editors", ["active"], name: "index_auction_editors_on_active", using: :btree

  create_table "manage_editors_old", force: :cascade do |t|
    t.integer  "role_id",       limit: 4
    t.integer  "user_id",       limit: 4
    t.string   "name",          limit: 255
    t.boolean  "active",                    default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "department",    limit: 255
    t.integer  "supervisor_id", limit: 4
  end

  add_index "manage_editors_old", ["active"], name: "index_manage_editors_on_active", using: :btree
  add_index "manage_editors_old", ["created_at"], name: "index_manage_editors_on_created_at", using: :btree
  add_index "manage_editors_old", ["destroyed_at"], name: "index_manage_editors_on_destroyed_at", using: :btree
  add_index "manage_editors_old", ["role_id"], name: "index_manage_editors_on_role_id", using: :btree
  add_index "manage_editors_old", ["updated_at"], name: "index_manage_editors_on_updated_at", using: :btree
  add_index "manage_editors_old", ["user_id"], name: "index_manage_editors_on_user_id", using: :btree

  create_table "manage_grants", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "role_id",      limit: 4
    t.boolean  "active",                 default: true, null: false
    t.integer  "lock_version", limit: 4, default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manage_grants", ["active", "editor_id", "role_id"], name: "by_active_and_editor_id_and_role_id", using: :btree

  create_table "manage_grants_old", force: :cascade do |t|
    t.integer  "editor_id",    limit: 4
    t.integer  "role_id",      limit: 4
    t.boolean  "active",                 default: true, null: false
    t.integer  "lock_version", limit: 4, default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "manage_logs", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "controller", limit: 4
    t.integer  "action",     limit: 4
    t.integer  "params_id",  limit: 4
    t.datetime "created_at"
  end

  create_table "manage_roles", force: :cascade do |t|
    t.integer  "user_id",                              limit: 4
    t.string   "name",                                 limit: 255
    t.text     "description",                          limit: 65535
    t.boolean  "active",                                             default: true
    t.datetime "destroyed_at"
    t.boolean  "create_auction_product"
    t.boolean  "show_auction_product"
    t.boolean  "update_auction_product"
    t.boolean  "destroy_auction_product"
    t.boolean  "create_auction_item"
    t.boolean  "show_auction_item"
    t.boolean  "update_auction_item"
    t.boolean  "destroy_auction_item"
    t.boolean  "create_auction_trade"
    t.boolean  "show_auction_trade"
    t.boolean  "update_auction_trade"
    t.boolean  "destroy_auction_trade"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_manage_editor"
    t.boolean  "create_manage_editor"
    t.boolean  "update_manage_editor"
    t.boolean  "destroy_manage_editor"
    t.boolean  "create_manage_role"
    t.boolean  "update_manage_role"
    t.boolean  "destroy_manage_role"
    t.boolean  "show_manage_role"
    t.boolean  "show_auction_country"
    t.boolean  "update_auction_country"
    t.boolean  "create_auction_country"
    t.boolean  "destroy_auction_country"
    t.boolean  "show_auction_province"
    t.boolean  "update_auction_province"
    t.boolean  "create_auction_province"
    t.boolean  "destroy_auction_province"
    t.boolean  "show_auction_city"
    t.boolean  "update_auction_city"
    t.boolean  "create_auction_city"
    t.boolean  "destroy_auction_city"
    t.boolean  "show_auction_town"
    t.boolean  "update_auction_town"
    t.boolean  "create_auction_town"
    t.boolean  "destroy_auction_town"
    t.boolean  "show_auction_category"
    t.boolean  "update_auction_category"
    t.boolean  "create_auction_category"
    t.boolean  "destroy_auction_category"
    t.boolean  "manage_auction_category"
    t.boolean  "show_auction_market"
    t.boolean  "update_auction_market"
    t.boolean  "create_auction_market"
    t.boolean  "destroy_auction_market"
    t.boolean  "manage_auction_market"
    t.boolean  "show_auction_recommend"
    t.boolean  "update_auction_recommend"
    t.boolean  "create_auction_recommend"
    t.boolean  "destroy_auction_recommend"
    t.boolean  "manage_auction_recommend"
    t.boolean  "show_auction_operator"
    t.boolean  "update_auction_operator"
    t.boolean  "create_auction_operator"
    t.boolean  "destroy_auction_operator"
    t.boolean  "manage_auction_operator"
    t.boolean  "show_auction_mail"
    t.boolean  "create_auction_mail"
    t.boolean  "update_auction_mail"
    t.boolean  "destroy_auction_mail"
    t.boolean  "manage_auction_mail"
    t.boolean  "show_auction_picture"
    t.boolean  "create_auction_picture"
    t.boolean  "update_auction_picture"
    t.boolean  "destroy_auction_picture"
    t.boolean  "manage_auction_picture"
    t.boolean  "show_auction_good"
    t.boolean  "create_auction_good"
    t.boolean  "update_auction_good"
    t.boolean  "destroy_auction_good"
    t.boolean  "manage_auction_good"
    t.boolean  "show_auction_lottery"
    t.boolean  "create_auction_lottery"
    t.boolean  "update_auction_lottery"
    t.boolean  "destroy_auction_lottery"
    t.boolean  "manage_auction_lottery"
    t.boolean  "show_auction_ticket"
    t.boolean  "create_auction_ticket"
    t.boolean  "update_auction_ticket"
    t.boolean  "destroy_auction_ticket"
    t.boolean  "manage_auction_ticket"
    t.integer  "lock_version",                         limit: 4,     default: 0
    t.boolean  "show_auction_brand"
    t.boolean  "create_auction_brand"
    t.boolean  "update_auction_brand"
    t.boolean  "destroy_auction_brand"
    t.boolean  "show_auction_product_attribute"
    t.boolean  "create_auction_product_attribute"
    t.boolean  "update_auction_product_attribute"
    t.boolean  "destroy_auction_product_attribute"
    t.boolean  "show_auction_link"
    t.boolean  "create_auction_link"
    t.boolean  "update_auction_link"
    t.boolean  "destroy_auction_link"
    t.boolean  "show_auction_coupon"
    t.boolean  "create_auction_coupon"
    t.boolean  "update_auction_coupon"
    t.boolean  "destroy_auction_coupon"
    t.boolean  "show_auction_notification"
    t.boolean  "create_auction_notification"
    t.boolean  "update_auction_notification"
    t.boolean  "destroy_auction_notification"
    t.boolean  "show_auction_promotion"
    t.boolean  "create_auction_promotion"
    t.boolean  "update_auction_promotion"
    t.boolean  "destroy_auction_promotion"
    t.boolean  "show_auction_ad"
    t.boolean  "create_auction_ad"
    t.boolean  "update_auction_ad"
    t.boolean  "destroy_auction_ad"
    t.boolean  "show_auction_unit"
    t.boolean  "create_auction_unit"
    t.boolean  "update_auction_unit"
    t.boolean  "destroy_auction_unit"
    t.boolean  "show_auction_contact"
    t.boolean  "create_auction_contact"
    t.boolean  "update_auction_contact"
    t.boolean  "destroy_auction_contact"
    t.boolean  "publish_auction_product"
    t.boolean  "publish_auction_item"
    t.boolean  "publish_auction_trade"
    t.boolean  "publish_manage_editor"
    t.boolean  "publish_manage_role"
    t.boolean  "publish_auction_country"
    t.boolean  "publish_auction_province"
    t.boolean  "publish_auction_city"
    t.boolean  "publish_auction_town"
    t.boolean  "publish_auction_category"
    t.boolean  "publish_auction_market"
    t.boolean  "publish_auction_recommend"
    t.boolean  "publish_auction_operator"
    t.boolean  "publish_auction_mail"
    t.boolean  "publish_auction_picture"
    t.boolean  "publish_auction_good"
    t.boolean  "publish_auction_lottery"
    t.boolean  "publish_auction_ticket"
    t.boolean  "publish_auction_brand"
    t.boolean  "manage_auction_brand"
    t.boolean  "publish_auction_product_attribute"
    t.boolean  "manage_auction_product_attribute"
    t.boolean  "publish_auction_link"
    t.boolean  "manage_auction_link"
    t.boolean  "publish_auction_coupon"
    t.boolean  "manage_auction_coupon"
    t.boolean  "publish_auction_notification"
    t.boolean  "manage_auction_notification"
    t.boolean  "publish_auction_promotion"
    t.boolean  "manage_auction_promotion"
    t.boolean  "publish_auction_ad"
    t.boolean  "manage_auction_ad"
    t.boolean  "publish_auction_contact"
    t.boolean  "manage_auction_contact"
    t.boolean  "publish_auction_unit"
    t.boolean  "manage_auction_unit"
    t.boolean  "manage_auction_product"
    t.boolean  "manage_auction_item"
    t.boolean  "manage_auction_trade"
    t.boolean  "manage_manage_editor"
    t.boolean  "manage_manage_role"
    t.boolean  "manage_auction_country"
    t.boolean  "manage_auction_province"
    t.boolean  "manage_auction_city"
    t.boolean  "manage_auction_town"
    t.boolean  "show_auction_message",                               default: false, null: false
    t.boolean  "create_auction_message",                             default: false, null: false
    t.boolean  "update_auction_message",                             default: false, null: false
    t.boolean  "destroy_auction_message",                            default: false, null: false
    t.boolean  "publish_auction_message",                            default: false, null: false
    t.boolean  "manage_auction_message",                             default: false, null: false
    t.boolean  "create_auction_event"
    t.boolean  "show_auction_event"
    t.boolean  "update_auction_event"
    t.boolean  "destroy_auction_event"
    t.boolean  "publish_auction_event"
    t.boolean  "manage_auction_event"
    t.boolean  "create_auction_voucher"
    t.boolean  "show_auction_voucher"
    t.boolean  "update_auction_voucher"
    t.boolean  "destroy_auction_voucher"
    t.boolean  "publish_auction_voucher"
    t.boolean  "manage_auction_voucher"
    t.boolean  "show_auction_collocation"
    t.boolean  "create_auction_collocation"
    t.boolean  "update_auction_collocation"
    t.boolean  "destroy_auction_collocation"
    t.boolean  "publish_auction_collocation"
    t.boolean  "manage_auction_collocation"
    t.boolean  "show_auction_synonym"
    t.boolean  "create_auction_synonym"
    t.boolean  "update_auction_synonym"
    t.boolean  "destroy_auction_synonym"
    t.boolean  "publish_auction_synonym"
    t.boolean  "manage_auction_synonym"
    t.boolean  "show_auction_sms"
    t.boolean  "create_auction_sms"
    t.boolean  "update_auction_sms"
    t.boolean  "destroy_auction_sms"
    t.boolean  "publish_auction_sms"
    t.boolean  "manage_auction_sms"
    t.boolean  "create_auction_preference"
    t.boolean  "show_auction_preference"
    t.boolean  "update_auction_preference"
    t.boolean  "destroy_auction_preference"
    t.boolean  "publish_auction_preference"
    t.boolean  "manage_auction_preference"
    t.boolean  "show_auction_click"
    t.boolean  "create_auction_click"
    t.boolean  "update_auction_click"
    t.boolean  "destroy_auction_click"
    t.boolean  "publish_auction_click"
    t.boolean  "manage_auction_click"
    t.boolean  "show_auction_mall"
    t.boolean  "create_auction_mall"
    t.boolean  "update_auction_mall"
    t.boolean  "destroy_auction_mall"
    t.boolean  "publish_auction_mall"
    t.boolean  "manage_auction_mall"
    t.boolean  "show_auction_costumer"
    t.boolean  "create_auction_costumer"
    t.boolean  "update_auction_costumer"
    t.boolean  "destroy_auction_costumer"
    t.boolean  "publish_auction_costumer"
    t.boolean  "manage_auction_costumer"
    t.boolean  "show_auction_call"
    t.boolean  "create_auction_call"
    t.boolean  "update_auction_call"
    t.boolean  "destroy_auction_call"
    t.boolean  "publish_auction_call"
    t.boolean  "manage_auction_call"
    t.boolean  "show_auction_queue"
    t.boolean  "create_auction_queue"
    t.boolean  "update_auction_queue"
    t.boolean  "destroy_auction_queue"
    t.boolean  "publish_auction_queue"
    t.boolean  "manage_auction_queue"
    t.boolean  "show_auction_sticky"
    t.boolean  "create_auction_sticky"
    t.boolean  "update_auction_sticky"
    t.boolean  "destroy_auction_sticky"
    t.boolean  "publish_auction_sticky"
    t.boolean  "manage_auction_sticky"
    t.boolean  "show_auction_level",                                 default: false, null: false
    t.boolean  "create_auction_level",                               default: false, null: false
    t.boolean  "update_auction_level",                               default: false, null: false
    t.boolean  "destroy_auction_level",                              default: false, null: false
    t.boolean  "publish_auction_level",                              default: false, null: false
    t.boolean  "manage_auction_level",                               default: false, null: false
    t.boolean  "show_auction_user",                                  default: false, null: false
    t.boolean  "create_auction_user",                                default: false, null: false
    t.boolean  "update_auction_user",                                default: false, null: false
    t.boolean  "destroy_auction_user",                               default: false, null: false
    t.boolean  "publish_auction_user",                               default: false, null: false
    t.boolean  "manage_auction_user",                                default: false, null: false
    t.boolean  "show_auction_package"
    t.boolean  "create_auction_package"
    t.boolean  "update_auction_package"
    t.boolean  "destroy_auction_package"
    t.boolean  "publish_auction_package"
    t.boolean  "manage_auction_package"
    t.boolean  "show_auction_pat",                                   default: false, null: false
    t.boolean  "create_auction_pat",                                 default: false, null: false
    t.boolean  "update_auction_pat",                                 default: false, null: false
    t.boolean  "destroy_auction_pat",                                default: false, null: false
    t.boolean  "publish_auction_pat",                                default: false, null: false
    t.boolean  "manage_auction_pat",                                 default: false, null: false
    t.boolean  "index_manage_editor",                                default: false, null: false
    t.boolean  "index_manage_role",                                  default: false, null: false
    t.boolean  "index_auction_message",                              default: false, null: false
    t.boolean  "index_auction_recommend",                            default: false, null: false
    t.boolean  "index_auction_market",                               default: false, null: false
    t.boolean  "index_auction_pat",                                  default: false, null: false
    t.boolean  "index_auction_collocation",                          default: false, null: false
    t.boolean  "index_auction_package",                              default: false, null: false
    t.boolean  "index_auction_sticky",                               default: false, null: false
    t.boolean  "index_auction_synonym",                              default: false, null: false
    t.boolean  "index_auction_mall",                                 default: false, null: false
    t.boolean  "index_auction_category",                             default: false, null: false
    t.boolean  "index_auction_brand",                                default: false, null: false
    t.boolean  "index_auction_product_attribute",                    default: false, null: false
    t.boolean  "index_auction_product",                              default: false, null: false
    t.boolean  "index_auction_item",                                 default: false, null: false
    t.boolean  "index_auction_trade",                                default: false, null: false
    t.boolean  "index_auction_contact",                              default: false, null: false
    t.boolean  "index_auction_user",                                 default: false, null: false
    t.boolean  "index_auction_level",                                default: false, null: false
    t.boolean  "index_auction_unit",                                 default: false, null: false
    t.boolean  "index_auction_notification",                         default: false, null: false
    t.boolean  "index_auction_preference",                           default: false, null: false
    t.boolean  "index_auction_operator",                             default: false, null: false
    t.boolean  "index_auction_queue",                                default: false, null: false
    t.boolean  "index_auction_costumer",                             default: false, null: false
    t.boolean  "index_auction_call",                                 default: false, null: false
    t.boolean  "index_auction_sms",                                  default: false, null: false
    t.boolean  "index_auction_mail",                                 default: false, null: false
    t.boolean  "index_auction_promotion",                            default: false, null: false
    t.boolean  "index_auction_ad",                                   default: false, null: false
    t.boolean  "index_auction_link",                                 default: false, null: false
    t.boolean  "index_auction_click",                                default: false, null: false
    t.boolean  "index_auction_event",                                default: false, null: false
    t.boolean  "index_auction_voucher",                              default: false, null: false
    t.boolean  "index_auction_coupon",                               default: false, null: false
    t.boolean  "index_auction_country",                              default: false, null: false
    t.boolean  "index_auction_province",                             default: false, null: false
    t.boolean  "index_auction_city",                                 default: false, null: false
    t.boolean  "index_auction_town",                                 default: false, null: false
    t.boolean  "index_manage_grant",                                 default: false, null: false
    t.boolean  "show_manage_grant",                                  default: false, null: false
    t.boolean  "create_manage_grant",                                default: false, null: false
    t.boolean  "update_manage_grant",                                default: false, null: false
    t.boolean  "destroy_manage_grant",                               default: false, null: false
    t.boolean  "publish_manage_grant",                               default: false, null: false
    t.boolean  "manage_manage_grant",                                default: false, null: false
    t.boolean  "index_auction_page",                                 default: false, null: false
    t.boolean  "show_auction_page",                                  default: false, null: false
    t.boolean  "create_auction_page",                                default: false, null: false
    t.boolean  "update_auction_page",                                default: false, null: false
    t.boolean  "destroy_auction_page",                               default: false, null: false
    t.boolean  "publish_auction_page",                               default: false, null: false
    t.boolean  "manage_auction_page",                                default: false, null: false
    t.boolean  "index_auction_card",                                 default: false, null: false
    t.boolean  "show_auction_card",                                  default: false, null: false
    t.boolean  "create_auction_card",                                default: false, null: false
    t.boolean  "update_auction_card",                                default: false, null: false
    t.boolean  "destroy_auction_card",                               default: false, null: false
    t.boolean  "publish_auction_card",                               default: false, null: false
    t.boolean  "manage_auction_card",                                default: false, null: false
    t.boolean  "index_auction_transaction",                          default: false, null: false
    t.boolean  "show_auction_transaction",                           default: false, null: false
    t.boolean  "create_auction_transaction",                         default: false, null: false
    t.boolean  "update_auction_transaction",                         default: false, null: false
    t.boolean  "destroy_auction_transaction",                        default: false, null: false
    t.boolean  "publish_auction_transaction",                        default: false, null: false
    t.boolean  "manage_auction_transaction",                         default: false, null: false
    t.boolean  "index_auction_guess",                                default: false, null: false
    t.boolean  "show_auction_guess",                                 default: false, null: false
    t.boolean  "create_auction_guess",                               default: false, null: false
    t.boolean  "update_auction_guess",                               default: false, null: false
    t.boolean  "destroy_auction_guess",                              default: false, null: false
    t.boolean  "publish_auction_guess",                              default: false, null: false
    t.boolean  "manage_auction_guess",                               default: false, null: false
    t.boolean  "index_core_city",                                    default: false, null: false
    t.boolean  "show_core_city",                                     default: false, null: false
    t.boolean  "update_core_city",                                   default: false, null: false
    t.boolean  "create_core_city",                                   default: false, null: false
    t.boolean  "destroy_core_city",                                  default: false, null: false
    t.boolean  "manage_core_city",                                   default: false, null: false
    t.boolean  "publish_core_city",                                  default: false, null: false
    t.boolean  "index_core_college",                                 default: false, null: false
    t.boolean  "show_core_college",                                  default: false, null: false
    t.boolean  "update_core_college",                                default: false, null: false
    t.boolean  "create_core_college",                                default: false, null: false
    t.boolean  "destroy_core_college",                               default: false, null: false
    t.boolean  "manage_core_college",                                default: false, null: false
    t.boolean  "publish_core_college",                               default: false, null: false
    t.boolean  "index_core_network",                                 default: false, null: false
    t.boolean  "show_core_network",                                  default: false, null: false
    t.boolean  "update_core_network",                                default: false, null: false
    t.boolean  "create_core_network",                                default: false, null: false
    t.boolean  "destroy_core_network",                               default: false, null: false
    t.boolean  "manage_core_network",                                default: false, null: false
    t.boolean  "publish_core_network",                               default: false, null: false
    t.boolean  "index_core_account",                                 default: false, null: false
    t.boolean  "show_core_account",                                  default: false, null: false
    t.boolean  "update_core_account",                                default: false, null: false
    t.boolean  "create_core_account",                                default: false, null: false
    t.boolean  "destroy_core_account",                               default: false, null: false
    t.boolean  "manage_core_account",                                default: false, null: false
    t.boolean  "publish_core_account",                               default: false, null: false
    t.boolean  "index_core_comment",                                 default: false, null: false
    t.boolean  "show_core_comment",                                  default: false, null: false
    t.boolean  "update_core_comment",                                default: false, null: false
    t.boolean  "create_core_comment",                                default: false, null: false
    t.boolean  "destroy_core_comment",                               default: false, null: false
    t.boolean  "manage_core_comment",                                default: false, null: false
    t.boolean  "publish_core_comment",                               default: false, null: false
    t.boolean  "index_core_link",                                    default: false, null: false
    t.boolean  "show_core_link",                                     default: false, null: false
    t.boolean  "update_core_link",                                   default: false, null: false
    t.boolean  "create_core_link",                                   default: false, null: false
    t.boolean  "destroy_core_link",                                  default: false, null: false
    t.boolean  "manage_core_link",                                   default: false, null: false
    t.boolean  "publish_core_link",                                  default: false, null: false
    t.boolean  "index_core_list",                                    default: false, null: false
    t.boolean  "show_core_list",                                     default: false, null: false
    t.boolean  "update_core_list",                                   default: false, null: false
    t.boolean  "create_core_list",                                   default: false, null: false
    t.boolean  "destroy_core_list",                                  default: false, null: false
    t.boolean  "manage_core_list",                                   default: false, null: false
    t.boolean  "publish_core_list",                                  default: false, null: false
    t.boolean  "index_core_report",                                  default: false, null: false
    t.boolean  "show_core_report",                                   default: false, null: false
    t.boolean  "update_core_report",                                 default: false, null: false
    t.boolean  "create_core_report",                                 default: false, null: false
    t.boolean  "destroy_core_report",                                default: false, null: false
    t.boolean  "manage_core_report",                                 default: false, null: false
    t.boolean  "publish_core_report",                                default: false, null: false
    t.boolean  "index_core_feed",                                    default: false, null: false
    t.boolean  "show_core_feed",                                     default: false, null: false
    t.boolean  "update_core_feed",                                   default: false, null: false
    t.boolean  "create_core_feed",                                   default: false, null: false
    t.boolean  "destroy_core_feed",                                  default: false, null: false
    t.boolean  "manage_core_feed",                                   default: false, null: false
    t.boolean  "publish_core_feed",                                  default: false, null: false
    t.boolean  "index_core_user",                                    default: false, null: false
    t.boolean  "show_core_user",                                     default: false, null: false
    t.boolean  "update_core_user",                                   default: false, null: false
    t.boolean  "create_core_user",                                   default: false, null: false
    t.boolean  "destroy_core_user",                                  default: false, null: false
    t.boolean  "manage_core_user",                                   default: false, null: false
    t.boolean  "publish_core_user",                                  default: false, null: false
    t.boolean  "index_core_keyword",                                 default: false, null: false
    t.boolean  "show_core_keyword",                                  default: false, null: false
    t.boolean  "update_core_keyword",                                default: false, null: false
    t.boolean  "create_core_keyword",                                default: false, null: false
    t.boolean  "destroy_core_keyword",                               default: false, null: false
    t.boolean  "manage_core_keyword",                                default: false, null: false
    t.boolean  "publish_core_keyword",                               default: false, null: false
    t.boolean  "index_core_registration",                            default: false, null: false
    t.boolean  "show_core_registration",                             default: false, null: false
    t.boolean  "update_core_registration",                           default: false, null: false
    t.boolean  "create_core_registration",                           default: false, null: false
    t.boolean  "destroy_core_registration",                          default: false, null: false
    t.boolean  "manage_core_registration",                           default: false, null: false
    t.boolean  "publish_core_registration",                          default: false, null: false
    t.boolean  "index_core_invitation",                              default: false, null: false
    t.boolean  "show_core_invitation",                               default: false, null: false
    t.boolean  "update_core_invitation",                             default: false, null: false
    t.boolean  "create_core_invitation",                             default: false, null: false
    t.boolean  "destroy_core_invitation",                            default: false, null: false
    t.boolean  "manage_core_invitation",                             default: false, null: false
    t.boolean  "publish_core_invitation",                            default: false, null: false
    t.boolean  "index_core_transaction",                             default: false, null: false
    t.boolean  "show_core_transaction",                              default: false, null: false
    t.boolean  "update_core_transaction",                            default: false, null: false
    t.boolean  "create_core_transaction",                            default: false, null: false
    t.boolean  "destroy_core_transaction",                           default: false, null: false
    t.boolean  "manage_core_transaction",                            default: false, null: false
    t.boolean  "publish_core_transaction",                           default: false, null: false
    t.boolean  "index_core_stat",                                    default: false, null: false
    t.boolean  "show_core_stat",                                     default: false, null: false
    t.boolean  "update_core_stat",                                   default: false, null: false
    t.boolean  "create_core_stat",                                   default: false, null: false
    t.boolean  "destroy_core_stat",                                  default: false, null: false
    t.boolean  "manage_core_stat",                                   default: false, null: false
    t.boolean  "publish_core_stat",                                  default: false, null: false
    t.boolean  "index_about_article",                                default: false, null: false
    t.boolean  "show_about_article",                                 default: false, null: false
    t.boolean  "update_about_article",                               default: false, null: false
    t.boolean  "create_about_article",                               default: false, null: false
    t.boolean  "destroy_about_article",                              default: false, null: false
    t.boolean  "manage_about_article",                               default: false, null: false
    t.boolean  "publish_about_article",                              default: false, null: false
    t.boolean  "index_about_job",                                    default: false, null: false
    t.boolean  "show_about_job",                                     default: false, null: false
    t.boolean  "update_about_job",                                   default: false, null: false
    t.boolean  "create_about_job",                                   default: false, null: false
    t.boolean  "destroy_about_job",                                  default: false, null: false
    t.boolean  "manage_about_job",                                   default: false, null: false
    t.boolean  "publish_about_job",                                  default: false, null: false
    t.boolean  "index_about_person",                                 default: false, null: false
    t.boolean  "show_about_person",                                  default: false, null: false
    t.boolean  "update_about_person",                                default: false, null: false
    t.boolean  "create_about_person",                                default: false, null: false
    t.boolean  "destroy_about_person",                               default: false, null: false
    t.boolean  "manage_about_person",                                default: false, null: false
    t.boolean  "publish_about_person",                               default: false, null: false
    t.boolean  "index_about_link",                                   default: false, null: false
    t.boolean  "show_about_link",                                    default: false, null: false
    t.boolean  "update_about_link",                                  default: false, null: false
    t.boolean  "create_about_link",                                  default: false, null: false
    t.boolean  "destroy_about_link",                                 default: false, null: false
    t.boolean  "manage_about_link",                                  default: false, null: false
    t.boolean  "publish_about_link",                                 default: false, null: false
    t.boolean  "index_develop_document_editor",                      default: false, null: false
    t.boolean  "show_develop_document_editor",                       default: false, null: false
    t.boolean  "update_develop_document_editor",                     default: false, null: false
    t.boolean  "create_develop_document_editor",                     default: false, null: false
    t.boolean  "destroy_develop_document_editor",                    default: false, null: false
    t.boolean  "manage_develop_document_editor",                     default: false, null: false
    t.boolean  "publish_develop_document_editor",                    default: false, null: false
    t.boolean  "index_develop_document_role",                        default: false, null: false
    t.boolean  "show_develop_document_role",                         default: false, null: false
    t.boolean  "update_develop_document_role",                       default: false, null: false
    t.boolean  "create_develop_document_role",                       default: false, null: false
    t.boolean  "destroy_develop_document_role",                      default: false, null: false
    t.boolean  "manage_develop_document_role",                       default: false, null: false
    t.boolean  "publish_develop_document_role",                      default: false, null: false
    t.boolean  "index_search_brand",                                 default: false, null: false
    t.boolean  "show_search_brand",                                  default: false, null: false
    t.boolean  "update_search_brand",                                default: false, null: false
    t.boolean  "create_search_brand",                                default: false, null: false
    t.boolean  "destroy_search_brand",                               default: false, null: false
    t.boolean  "manage_search_brand",                                default: false, null: false
    t.boolean  "publish_search_brand",                               default: false, null: false
    t.boolean  "index_search_brand_mapping",                         default: false, null: false
    t.boolean  "show_search_brand_mapping",                          default: false, null: false
    t.boolean  "update_search_brand_mapping",                        default: false, null: false
    t.boolean  "create_search_brand_mapping",                        default: false, null: false
    t.boolean  "destroy_search_brand_mapping",                       default: false, null: false
    t.boolean  "manage_search_brand_mapping",                        default: false, null: false
    t.boolean  "publish_search_brand_mapping",                       default: false, null: false
    t.boolean  "index_search_category",                              default: false, null: false
    t.boolean  "show_search_category",                               default: false, null: false
    t.boolean  "update_search_category",                             default: false, null: false
    t.boolean  "create_search_category",                             default: false, null: false
    t.boolean  "destroy_search_category",                            default: false, null: false
    t.boolean  "manage_search_category",                             default: false, null: false
    t.boolean  "publish_search_category",                            default: false, null: false
    t.boolean  "index_search_category_mapping",                      default: false, null: false
    t.boolean  "show_search_category_mapping",                       default: false, null: false
    t.boolean  "update_search_category_mapping",                     default: false, null: false
    t.boolean  "create_search_category_mapping",                     default: false, null: false
    t.boolean  "destroy_search_category_mapping",                    default: false, null: false
    t.boolean  "manage_search_category_mapping",                     default: false, null: false
    t.boolean  "publish_search_category_mapping",                    default: false, null: false
    t.boolean  "index_search_editor",                                default: false, null: false
    t.boolean  "show_search_editor",                                 default: false, null: false
    t.boolean  "update_search_editor",                               default: false, null: false
    t.boolean  "create_search_editor",                               default: false, null: false
    t.boolean  "destroy_search_editor",                              default: false, null: false
    t.boolean  "manage_search_editor",                               default: false, null: false
    t.boolean  "publish_search_editor",                              default: false, null: false
    t.boolean  "index_search_mall",                                  default: false, null: false
    t.boolean  "show_search_mall",                                   default: false, null: false
    t.boolean  "update_search_mall",                                 default: false, null: false
    t.boolean  "create_search_mall",                                 default: false, null: false
    t.boolean  "destroy_search_mall",                                default: false, null: false
    t.boolean  "manage_search_mall",                                 default: false, null: false
    t.boolean  "publish_search_mall",                                default: false, null: false
    t.boolean  "index_search_product",                               default: false, null: false
    t.boolean  "show_search_product",                                default: false, null: false
    t.boolean  "update_search_product",                              default: false, null: false
    t.boolean  "create_search_product",                              default: false, null: false
    t.boolean  "destroy_search_product",                             default: false, null: false
    t.boolean  "manage_search_product",                              default: false, null: false
    t.boolean  "publish_search_product",                             default: false, null: false
    t.boolean  "index_auction_picture",                              default: false, null: false
    t.boolean  "index_auction_good",                                 default: false, null: false
    t.boolean  "index_auction_lottery",                              default: false, null: false
    t.boolean  "index_auction_ticket",                               default: false, null: false
    t.boolean  "index_auction_chat",                                 default: false, null: false
    t.boolean  "show_auction_chat",                                  default: false, null: false
    t.boolean  "create_auction_chat",                                default: false, null: false
    t.boolean  "update_auction_chat",                                default: false, null: false
    t.boolean  "destroy_auction_chat",                               default: false, null: false
    t.boolean  "publish_auction_chat",                               default: false, null: false
    t.boolean  "manage_auction_chat",                                default: false, null: false
    t.boolean  "index_auction_multibuy",                             default: false, null: false
    t.boolean  "show_auction_multibuy",                              default: false, null: false
    t.boolean  "create_auction_multibuy",                            default: false, null: false
    t.boolean  "update_auction_multibuy",                            default: false, null: false
    t.boolean  "destroy_auction_multibuy",                           default: false, null: false
    t.boolean  "publish_auction_multibuy",                           default: false, null: false
    t.boolean  "manage_auction_multibuy",                            default: false, null: false
    t.boolean  "index_office_human_company",                         default: false, null: false
    t.boolean  "show_office_human_company",                          default: false, null: false
    t.boolean  "create_office_human_company",                        default: false, null: false
    t.boolean  "update_office_human_company",                        default: false, null: false
    t.boolean  "destroy_office_human_company",                       default: false, null: false
    t.boolean  "publish_office_human_company",                       default: false, null: false
    t.boolean  "manage_office_human_company",                        default: false, null: false
    t.boolean  "index_office_human_department",                      default: false, null: false
    t.boolean  "show_office_human_department",                       default: false, null: false
    t.boolean  "create_office_human_department",                     default: false, null: false
    t.boolean  "update_office_human_department",                     default: false, null: false
    t.boolean  "destroy_office_human_department",                    default: false, null: false
    t.boolean  "publish_office_human_department",                    default: false, null: false
    t.boolean  "manage_office_human_department",                     default: false, null: false
    t.boolean  "index_office_human_employee",                        default: false, null: false
    t.boolean  "show_office_human_employee",                         default: false, null: false
    t.boolean  "create_office_human_employee",                       default: false, null: false
    t.boolean  "update_office_human_employee",                       default: false, null: false
    t.boolean  "destroy_office_human_employee",                      default: false, null: false
    t.boolean  "publish_office_human_employee",                      default: false, null: false
    t.boolean  "manage_office_human_employee",                       default: false, null: false
    t.boolean  "index_manage_log",                                   default: false, null: false
    t.boolean  "show_manage_log",                                    default: false, null: false
    t.boolean  "create_manage_log",                                  default: false, null: false
    t.boolean  "update_manage_log",                                  default: false, null: false
    t.boolean  "destroy_manage_log",                                 default: false, null: false
    t.boolean  "publish_manage_log",                                 default: false, null: false
    t.boolean  "manage_manage_log",                                  default: false, null: false
    t.boolean  "index_manage_user",                                  default: false, null: false
    t.boolean  "show_manage_user",                                   default: false, null: false
    t.boolean  "create_manage_user",                                 default: false, null: false
    t.boolean  "update_manage_user",                                 default: false, null: false
    t.boolean  "destroy_manage_user",                                default: false, null: false
    t.boolean  "publish_manage_user",                                default: false, null: false
    t.boolean  "manage_manage_user",                                 default: false, null: false
    t.boolean  "index_retail_topic",                                 default: false, null: false
    t.boolean  "show_retail_topic",                                  default: false, null: false
    t.boolean  "create_retail_topic",                                default: false, null: false
    t.boolean  "update_retail_topic",                                default: false, null: false
    t.boolean  "destroy_retail_topic",                               default: false, null: false
    t.boolean  "publish_retail_topic",                               default: false, null: false
    t.boolean  "manage_retail_topic",                                default: false, null: false
    t.boolean  "index_office_finance_currency",                      default: false, null: false
    t.boolean  "show_office_finance_currency",                       default: false, null: false
    t.boolean  "create_office_finance_currency",                     default: false, null: false
    t.boolean  "update_office_finance_currency",                     default: false, null: false
    t.boolean  "destroy_office_finance_currency",                    default: false, null: false
    t.boolean  "publish_office_finance_currency",                    default: false, null: false
    t.boolean  "manage_office_finance_currency",                     default: false, null: false
    t.boolean  "index_office_finance_exchange_rate",                 default: false, null: false
    t.boolean  "show_office_finance_exchange_rate",                  default: false, null: false
    t.boolean  "create_office_finance_exchange_rate",                default: false, null: false
    t.boolean  "update_office_finance_exchange_rate",                default: false, null: false
    t.boolean  "destroy_office_finance_exchange_rate",               default: false, null: false
    t.boolean  "publish_office_finance_exchange_rate",               default: false, null: false
    t.boolean  "manage_office_finance_exchange_rate",                default: false, null: false
    t.boolean  "index_office_purchase_application",                  default: false, null: false
    t.boolean  "show_office_purchase_application",                   default: false, null: false
    t.boolean  "create_office_purchase_application",                 default: false, null: false
    t.boolean  "update_office_purchase_application",                 default: false, null: false
    t.boolean  "destroy_office_purchase_application",                default: false, null: false
    t.boolean  "publish_office_purchase_application",                default: false, null: false
    t.boolean  "manage_office_purchase_application",                 default: false, null: false
    t.boolean  "index_office_purchase_provider",                     default: false, null: false
    t.boolean  "show_office_purchase_provider",                      default: false, null: false
    t.boolean  "create_office_purchase_provider",                    default: false, null: false
    t.boolean  "update_office_purchase_provider",                    default: false, null: false
    t.boolean  "destroy_office_purchase_provider",                   default: false, null: false
    t.boolean  "publish_office_purchase_provider",                   default: false, null: false
    t.boolean  "manage_office_purchase_provider",                    default: false, null: false
    t.boolean  "index_retail_shop",                                  default: false, null: false
    t.boolean  "show_retail_shop",                                   default: false, null: false
    t.boolean  "create_retail_shop",                                 default: false, null: false
    t.boolean  "update_retail_shop",                                 default: false, null: false
    t.boolean  "destroy_retail_shop",                                default: false, null: false
    t.boolean  "publish_retail_shop",                                default: false, null: false
    t.boolean  "manage_retail_shop",                                 default: false, null: false
    t.boolean  "index_retail_commission",                            default: false, null: false
    t.boolean  "show_retail_commission",                             default: false, null: false
    t.boolean  "create_retail_commission",                           default: false, null: false
    t.boolean  "update_retail_commission",                           default: false, null: false
    t.boolean  "destroy_retail_commission",                          default: false, null: false
    t.boolean  "publish_retail_commission",                          default: false, null: false
    t.boolean  "manage_retail_commission",                           default: false, null: false
    t.boolean  "index_retail_guide",                                 default: false, null: false
    t.boolean  "show_retail_guide",                                  default: false, null: false
    t.boolean  "create_retail_guide",                                default: false, null: false
    t.boolean  "update_retail_guide",                                default: false, null: false
    t.boolean  "destroy_retail_guide",                               default: false, null: false
    t.boolean  "publish_retail_guide",                               default: false, null: false
    t.boolean  "manage_retail_guide",                                default: false, null: false
    t.boolean  "index_retail_mall_promotion",                        default: false, null: false
    t.boolean  "show_retail_mall_promotion",                         default: false, null: false
    t.boolean  "create_retail_mall_promotion",                       default: false, null: false
    t.boolean  "update_retail_mall_promotion",                       default: false, null: false
    t.boolean  "destroy_retail_mall_promotion",                      default: false, null: false
    t.boolean  "publish_retail_mall_promotion",                      default: false, null: false
    t.boolean  "manage_retail_mall_promotion",                       default: false, null: false
    t.boolean  "index_retail_cart",                                                  null: false
    t.boolean  "show_retail_cart",                                                   null: false
    t.boolean  "create_retail_cart",                                                 null: false
    t.boolean  "update_retail_cart",                                                 null: false
    t.boolean  "destroy_retail_cart",                                                null: false
    t.boolean  "publish_retail_cart",                                                null: false
    t.boolean  "manage_retail_cart",                                                 null: false
    t.boolean  "index_data_news_article",                            default: false, null: false
    t.boolean  "update_data_news_article",                           default: false, null: false
    t.boolean  "create_data_news_article",                           default: false, null: false
    t.boolean  "show_data_news_article",                             default: false, null: false
    t.boolean  "destroy_data_news_article",                          default: false, null: false
    t.boolean  "publish_data_news_article",                          default: false, null: false
    t.boolean  "manage_data_news_article",                           default: false, null: false
    t.boolean  "index_data_news_category",                           default: false, null: false
    t.boolean  "update_data_news_category",                          default: false, null: false
    t.boolean  "create_data_news_category",                          default: false, null: false
    t.boolean  "show_data_news_category",                            default: false, null: false
    t.boolean  "destroy_data_news_category",                         default: false, null: false
    t.boolean  "publish_data_news_category",                         default: false, null: false
    t.boolean  "manage_data_news_category",                          default: false, null: false
    t.boolean  "index_data_news_pattern",                            default: false, null: false
    t.boolean  "update_data_news_pattern",                           default: false, null: false
    t.boolean  "create_data_news_pattern",                           default: false, null: false
    t.boolean  "show_data_news_pattern",                             default: false, null: false
    t.boolean  "destroy_data_news_pattern",                          default: false, null: false
    t.boolean  "publish_data_news_pattern",                          default: false, null: false
    t.boolean  "manage_data_news_pattern",                           default: false, null: false
    t.boolean  "index_data_news_person",                             default: false, null: false
    t.boolean  "update_data_news_person",                            default: false, null: false
    t.boolean  "create_data_news_person",                            default: false, null: false
    t.boolean  "show_data_news_person",                              default: false, null: false
    t.boolean  "destroy_data_news_person",                           default: false, null: false
    t.boolean  "publish_data_news_person",                           default: false, null: false
    t.boolean  "manage_data_news_person",                            default: false, null: false
    t.boolean  "index_data_news_article_brand",                      default: false, null: false
    t.boolean  "update_data_news_article_brand",                     default: false, null: false
    t.boolean  "create_data_news_article_brand",                     default: false, null: false
    t.boolean  "show_data_news_article_brand",                       default: false, null: false
    t.boolean  "destroy_data_news_article_brand",                    default: false, null: false
    t.boolean  "publish_data_news_article_brand",                    default: false, null: false
    t.boolean  "manage_data_news_article_brand",                     default: false, null: false
    t.boolean  "index_data_news_article_person",                     default: false, null: false
    t.boolean  "update_data_news_article_person",                    default: false, null: false
    t.boolean  "create_data_news_article_person",                    default: false, null: false
    t.boolean  "show_data_news_article_person",                      default: false, null: false
    t.boolean  "destroy_data_news_article_person",                   default: false, null: false
    t.boolean  "publish_data_news_article_person",                   default: false, null: false
    t.boolean  "manage_data_news_article_person",                    default: false, null: false
    t.boolean  "index_data_bible_article",                           default: false, null: false
    t.boolean  "update_data_bible_article",                          default: false, null: false
    t.boolean  "create_data_bible_article",                          default: false, null: false
    t.boolean  "show_data_bible_article",                            default: false, null: false
    t.boolean  "destroy_data_bible_article",                         default: false, null: false
    t.boolean  "publish_data_bible_article",                         default: false, null: false
    t.boolean  "manage_data_bible_article",                          default: false, null: false
    t.boolean  "index_data_bible_category",                          default: false, null: false
    t.boolean  "update_data_bible_category",                         default: false, null: false
    t.boolean  "create_data_bible_category",                         default: false, null: false
    t.boolean  "show_data_bible_category",                           default: false, null: false
    t.boolean  "destroy_data_bible_category",                        default: false, null: false
    t.boolean  "publish_data_bible_category",                        default: false, null: false
    t.boolean  "manage_data_bible_category",                         default: false, null: false
    t.boolean  "index_data_bible_pattern",                           default: false, null: false
    t.boolean  "update_data_bible_pattern",                          default: false, null: false
    t.boolean  "create_data_bible_pattern",                          default: false, null: false
    t.boolean  "show_data_bible_pattern",                            default: false, null: false
    t.boolean  "destroy_data_bible_pattern",                         default: false, null: false
    t.boolean  "publish_data_bible_pattern",                         default: false, null: false
    t.boolean  "manage_data_bible_pattern",                          default: false, null: false
    t.boolean  "index_data_common_country",                          default: false, null: false
    t.boolean  "update_data_common_country",                         default: false, null: false
    t.boolean  "create_data_common_country",                         default: false, null: false
    t.boolean  "show_data_common_country",                           default: false, null: false
    t.boolean  "destroy_data_common_country",                        default: false, null: false
    t.boolean  "publish_data_common_country",                        default: false, null: false
    t.boolean  "manage_data_common_country",                         default: false, null: false
    t.boolean  "index_data_common_currency",                         default: false, null: false
    t.boolean  "update_data_common_currency",                        default: false, null: false
    t.boolean  "create_data_common_currency",                        default: false, null: false
    t.boolean  "show_data_common_currency",                          default: false, null: false
    t.boolean  "destroy_data_common_currency",                       default: false, null: false
    t.boolean  "publish_data_common_currency",                       default: false, null: false
    t.boolean  "manage_data_common_currency",                        default: false, null: false
    t.boolean  "index_data_common_file",                             default: false, null: false
    t.boolean  "update_data_common_file",                            default: false, null: false
    t.boolean  "create_data_common_file",                            default: false, null: false
    t.boolean  "show_data_common_file",                              default: false, null: false
    t.boolean  "destroy_data_common_file",                           default: false, null: false
    t.boolean  "publish_data_common_file",                           default: false, null: false
    t.boolean  "manage_data_common_file",                            default: false, null: false
    t.boolean  "index_data_product_article",                         default: false, null: false
    t.boolean  "update_data_product_article",                        default: false, null: false
    t.boolean  "create_data_product_article",                        default: false, null: false
    t.boolean  "show_data_product_article",                          default: false, null: false
    t.boolean  "destroy_data_product_article",                       default: false, null: false
    t.boolean  "publish_data_product_article",                       default: false, null: false
    t.boolean  "manage_data_product_article",                        default: false, null: false
    t.boolean  "index_data_product_brand",                           default: false, null: false
    t.boolean  "update_data_product_brand",                          default: false, null: false
    t.boolean  "create_data_product_brand",                          default: false, null: false
    t.boolean  "show_data_product_brand",                            default: false, null: false
    t.boolean  "destroy_data_product_brand",                         default: false, null: false
    t.boolean  "publish_data_product_brand",                         default: false, null: false
    t.boolean  "manage_data_product_brand",                          default: false, null: false
    t.boolean  "index_data_product_category",                        default: false, null: false
    t.boolean  "update_data_product_category",                       default: false, null: false
    t.boolean  "create_data_product_category",                       default: false, null: false
    t.boolean  "show_data_product_category",                         default: false, null: false
    t.boolean  "destroy_data_product_category",                      default: false, null: false
    t.boolean  "publish_data_product_category",                      default: false, null: false
    t.boolean  "manage_data_product_category",                       default: false, null: false
    t.boolean  "index_data_product_crowd",                           default: false, null: false
    t.boolean  "update_data_product_crowd",                          default: false, null: false
    t.boolean  "create_data_product_crowd",                          default: false, null: false
    t.boolean  "show_data_product_crowd",                            default: false, null: false
    t.boolean  "destroy_data_product_crowd",                         default: false, null: false
    t.boolean  "publish_data_product_crowd",                         default: false, null: false
    t.boolean  "manage_data_product_crowd",                          default: false, null: false
    t.boolean  "index_data_uzine_audio",                             default: false, null: false
    t.boolean  "update_data_uzine_audio",                            default: false, null: false
    t.boolean  "create_data_uzine_audio",                            default: false, null: false
    t.boolean  "show_data_uzine_audio",                              default: false, null: false
    t.boolean  "destroy_data_uzine_audio",                           default: false, null: false
    t.boolean  "publish_data_uzine_audio",                           default: false, null: false
    t.boolean  "manage_data_uzine_audio",                            default: false, null: false
    t.boolean  "index_data_uzine_image",                             default: false, null: false
    t.boolean  "update_data_uzine_image",                            default: false, null: false
    t.boolean  "create_data_uzine_image",                            default: false, null: false
    t.boolean  "show_data_uzine_image",                              default: false, null: false
    t.boolean  "destroy_data_uzine_image",                           default: false, null: false
    t.boolean  "publish_data_uzine_image",                           default: false, null: false
    t.boolean  "manage_data_uzine_image",                            default: false, null: false
    t.boolean  "index_data_uzine_magazine",                          default: false, null: false
    t.boolean  "update_data_uzine_magazine",                         default: false, null: false
    t.boolean  "create_data_uzine_magazine",                         default: false, null: false
    t.boolean  "show_data_uzine_magazine",                           default: false, null: false
    t.boolean  "destroy_data_uzine_magazine",                        default: false, null: false
    t.boolean  "publish_data_uzine_magazine",                        default: false, null: false
    t.boolean  "manage_data_uzine_magazine",                         default: false, null: false
    t.boolean  "index_data_uzine_page",                              default: false, null: false
    t.boolean  "update_data_uzine_page",                             default: false, null: false
    t.boolean  "create_data_uzine_page",                             default: false, null: false
    t.boolean  "show_data_uzine_page",                               default: false, null: false
    t.boolean  "destroy_data_uzine_page",                            default: false, null: false
    t.boolean  "publish_data_uzine_page",                            default: false, null: false
    t.boolean  "manage_data_uzine_page",                             default: false, null: false
    t.boolean  "index_retail_game",                                  default: false, null: false
    t.boolean  "show_retail_game",                                   default: false, null: false
    t.boolean  "create_retail_game",                                 default: false, null: false
    t.boolean  "update_retail_game",                                 default: false, null: false
    t.boolean  "destroy_retail_game",                                default: false, null: false
    t.boolean  "publish_retail_game",                                default: false, null: false
    t.boolean  "manage_retail_game",                                 default: false, null: false
    t.boolean  "index_retail_trophy",                                default: false, null: false
    t.boolean  "show_retail_trophy",                                 default: false, null: false
    t.boolean  "create_retail_trophy",                               default: false, null: false
    t.boolean  "update_retail_trophy",                               default: false, null: false
    t.boolean  "destroy_retail_trophy",                              default: false, null: false
    t.boolean  "publish_retail_trophy",                              default: false, null: false
    t.boolean  "manage_retail_trophy",                               default: false, null: false
    t.boolean  "index_core_device",                                  default: false, null: false
    t.boolean  "show_core_device",                                   default: false, null: false
    t.boolean  "create_core_device",                                 default: false, null: false
    t.boolean  "update_core_device",                                 default: false, null: false
    t.boolean  "destroy_core_device",                                default: false, null: false
    t.boolean  "publish_core_device",                                default: false, null: false
    t.boolean  "manage_core_device",                                 default: false, null: false
    t.boolean  "index_core_connection",                              default: true,  null: false
    t.boolean  "show_core_connection",                               default: true,  null: false
    t.boolean  "create_core_connection",                             default: true,  null: false
    t.boolean  "update_core_connection",                             default: true,  null: false
    t.boolean  "destroy_core_connection",                            default: true,  null: false
    t.boolean  "publish_core_connection",                            default: true,  null: false
    t.boolean  "manage_core_connection",                             default: true,  null: false
    t.boolean  "index_pay_merchant",                                 default: false, null: false
    t.boolean  "show_pay_merchant",                                  default: false, null: false
    t.boolean  "create_pay_merchant",                                default: false, null: false
    t.boolean  "update_pay_merchant",                                default: false, null: false
    t.boolean  "destroy_pay_merchant",                               default: false, null: false
    t.boolean  "publish_pay_merchant",                               default: false, null: false
    t.boolean  "manage_pay_merchant",                                default: false, null: false
    t.boolean  "index_pay_transaction",                              default: false, null: false
    t.boolean  "show_pay_transaction",                               default: false, null: false
    t.boolean  "create_pay_transaction",                             default: false, null: false
    t.boolean  "update_pay_transaction",                             default: false, null: false
    t.boolean  "destroy_pay_transaction",                            default: false, null: false
    t.boolean  "publish_pay_transaction",                            default: false, null: false
    t.boolean  "manage_pay_transaction",                             default: false, null: false
    t.boolean  "index_pay_user",                                     default: false, null: false
    t.boolean  "show_pay_user",                                      default: false, null: false
    t.boolean  "create_pay_user",                                    default: false, null: false
    t.boolean  "update_pay_user",                                    default: false, null: false
    t.boolean  "destroy_pay_user",                                   default: false, null: false
    t.boolean  "publish_pay_user",                                   default: false, null: false
    t.boolean  "manage_pay_user",                                    default: false, null: false
    t.boolean  "index_pay_behavior",                                 default: false, null: false
    t.boolean  "show_pay_behavior",                                  default: false, null: false
    t.boolean  "create_pay_behavior",                                default: false, null: false
    t.boolean  "update_pay_behavior",                                default: false, null: false
    t.boolean  "destroy_pay_behavior",                               default: false, null: false
    t.boolean  "publish_pay_behavior",                               default: false, null: false
    t.boolean  "manage_pay_behavior",                                default: false, null: false
    t.boolean  "index_pay_city",                                     default: false, null: false
    t.boolean  "show_pay_city",                                      default: false, null: false
    t.boolean  "create_pay_city",                                    default: false, null: false
    t.boolean  "update_pay_city",                                    default: false, null: false
    t.boolean  "destroy_pay_city",                                   default: false, null: false
    t.boolean  "publish_pay_city",                                   default: false, null: false
    t.boolean  "manage_pay_city",                                    default: false, null: false
    t.boolean  "index_pay_deal",                                     default: false, null: false
    t.boolean  "show_pay_deal",                                      default: false, null: false
    t.boolean  "create_pay_deal",                                    default: false, null: false
    t.boolean  "update_pay_deal",                                    default: false, null: false
    t.boolean  "destroy_pay_deal",                                   default: false, null: false
    t.boolean  "publish_pay_deal",                                   default: false, null: false
    t.boolean  "manage_pay_deal",                                    default: false, null: false
    t.boolean  "index_pay_mall",                                     default: false, null: false
    t.boolean  "show_pay_mall",                                      default: false, null: false
    t.boolean  "create_pay_mall",                                    default: false, null: false
    t.boolean  "update_pay_mall",                                    default: false, null: false
    t.boolean  "destroy_pay_mall",                                   default: false, null: false
    t.boolean  "publish_pay_mall",                                   default: false, null: false
    t.boolean  "manage_pay_mall",                                    default: false, null: false
    t.boolean  "index_pay_order",                                    default: false, null: false
    t.boolean  "show_pay_order",                                     default: false, null: false
    t.boolean  "create_pay_order",                                   default: false, null: false
    t.boolean  "update_pay_order",                                   default: false, null: false
    t.boolean  "destroy_pay_order",                                  default: false, null: false
    t.boolean  "publish_pay_order",                                  default: false, null: false
    t.boolean  "manage_pay_order",                                   default: false, null: false
    t.boolean  "index_pay_ticket",                                   default: false, null: false
    t.boolean  "show_pay_ticket",                                    default: false, null: false
    t.boolean  "create_pay_ticket",                                  default: false, null: false
    t.boolean  "update_pay_ticket",                                  default: false, null: false
    t.boolean  "destroy_pay_ticket",                                 default: false, null: false
    t.boolean  "publish_pay_ticket",                                 default: false, null: false
    t.boolean  "manage_pay_ticket",                                  default: false, null: false
    t.boolean  "index_pay_industry",                                 default: false, null: false
    t.boolean  "show_pay_industry",                                  default: false, null: false
    t.boolean  "create_pay_industry",                                default: false, null: false
    t.boolean  "update_pay_industry",                                default: false, null: false
    t.boolean  "destroy_pay_industry",                               default: false, null: false
    t.boolean  "publish_pay_industry",                               default: false, null: false
    t.boolean  "manage_pay_industry",                                default: false, null: false
    t.boolean  "index_pay_store",                                    default: false, null: false
    t.boolean  "show_pay_store",                                     default: false, null: false
    t.boolean  "create_pay_store",                                   default: false, null: false
    t.boolean  "update_pay_store",                                   default: false, null: false
    t.boolean  "destroy_pay_store",                                  default: false, null: false
    t.boolean  "publish_pay_store",                                  default: false, null: false
    t.boolean  "manage_pay_store",                                   default: false, null: false
    t.boolean  "index_pay_cashier",                                  default: false, null: false
    t.boolean  "show_pay_cashier",                                   default: false, null: false
    t.boolean  "create_pay_cashier",                                 default: false, null: false
    t.boolean  "update_pay_cashier",                                 default: false, null: false
    t.boolean  "destroy_pay_cashier",                                default: false, null: false
    t.boolean  "manage_pay_cashier",                                 default: false, null: false
    t.boolean  "publish_pay_cashier",                                default: false, null: false
    t.boolean  "index_pay_checkout",                                 default: false, null: false
    t.boolean  "show_pay_checkout",                                  default: false, null: false
    t.boolean  "create_pay_checkout",                                default: false, null: false
    t.boolean  "update_pay_checkout",                                default: false, null: false
    t.boolean  "destroy_pay_checkout",                               default: false, null: false
    t.boolean  "manage_pay_checkout",                                default: false, null: false
    t.boolean  "publish_pay_checkout",                               default: false, null: false
    t.boolean  "index_pay_counter",                                  default: false, null: false
    t.boolean  "show_pay_counter",                                   default: false, null: false
    t.boolean  "create_pay_counter",                                 default: false, null: false
    t.boolean  "update_pay_counter",                                 default: false, null: false
    t.boolean  "destroy_pay_counter",                                default: false, null: false
    t.boolean  "manage_pay_counter",                                 default: false, null: false
    t.boolean  "publish_pay_counter",                                default: false, null: false
    t.boolean  "index_pay_refundment",                               default: false, null: false
    t.boolean  "show_pay_refundment",                                default: false, null: false
    t.boolean  "create_pay_refundment",                              default: false, null: false
    t.boolean  "update_pay_refundment",                              default: false, null: false
    t.boolean  "destroy_pay_refundment",                             default: false, null: false
    t.boolean  "manage_pay_refundment",                              default: false, null: false
    t.boolean  "publish_pay_refundment",                             default: false, null: false
    t.boolean  "index_pay_level",                                    default: false, null: false
    t.boolean  "show_pay_level",                                     default: false, null: false
    t.boolean  "create_pay_level",                                   default: false, null: false
    t.boolean  "update_pay_level",                                   default: false, null: false
    t.boolean  "destroy_pay_level",                                  default: false, null: false
    t.boolean  "manage_pay_level",                                   default: false, null: false
    t.boolean  "publish_pay_level",                                  default: false, null: false
    t.boolean  "index_pay_card",                                     default: false, null: false
    t.boolean  "show_pay_card",                                      default: false, null: false
    t.boolean  "create_pay_card",                                    default: false, null: false
    t.boolean  "update_pay_card",                                    default: false, null: false
    t.boolean  "destroy_pay_card",                                   default: false, null: false
    t.boolean  "manage_pay_card",                                    default: false, null: false
    t.boolean  "publish_pay_card",                                   default: false, null: false
    t.boolean  "index_pay_exchange",                                 default: false, null: false
    t.boolean  "show_pay_exchange",                                  default: false, null: false
    t.boolean  "create_pay_exchange",                                default: false, null: false
    t.boolean  "update_pay_exchange",                                default: false, null: false
    t.boolean  "destroy_pay_exchange",                               default: false, null: false
    t.boolean  "manage_pay_exchange",                                default: false, null: false
    t.boolean  "publish_pay_exchange",                               default: false, null: false
    t.boolean  "index_pay_rate",                                     default: false, null: false
    t.boolean  "show_pay_rate",                                      default: false, null: false
    t.boolean  "create_pay_rate",                                    default: false, null: false
    t.boolean  "update_pay_rate",                                    default: false, null: false
    t.boolean  "destroy_pay_rate",                                   default: false, null: false
    t.boolean  "manage_pay_rate",                                    default: false, null: false
    t.boolean  "publish_pay_rate",                                   default: false, null: false
    t.boolean  "index_pay_transfer",                                 default: false, null: false
    t.boolean  "show_pay_transfer",                                  default: false, null: false
    t.boolean  "create_pay_transfer",                                default: false, null: false
    t.boolean  "update_pay_transfer",                                default: false, null: false
    t.boolean  "destroy_pay_transfer",                               default: false, null: false
    t.boolean  "manage_pay_transfer",                                default: false, null: false
    t.boolean  "publish_pay_transfer",                               default: false, null: false
    t.boolean  "index_cashier_order",                                default: false, null: false
    t.boolean  "show_cashier_order",                                 default: false, null: false
    t.boolean  "create_cashier_order",                               default: false, null: false
    t.boolean  "update_cashier_order",                               default: false, null: false
    t.boolean  "destroy_cashier_order",                              default: false, null: false
    t.boolean  "publish_cashier_order",                              default: false, null: false
    t.boolean  "manage_cashier_order",                               default: false, null: false
    t.boolean  "index_cashier_payment",                              default: false, null: false
    t.boolean  "show_cashier_payment",                               default: false, null: false
    t.boolean  "create_cashier_payment",                             default: false, null: false
    t.boolean  "update_cashier_payment",                             default: false, null: false
    t.boolean  "destroy_cashier_payment",                            default: false, null: false
    t.boolean  "publish_cashier_payment",                            default: false, null: false
    t.boolean  "manage_cashier_payment",                             default: false, null: false
    t.boolean  "index_pay_manual",                                   default: false, null: false
    t.boolean  "show_pay_manual",                                    default: false, null: false
    t.boolean  "create_pay_manual",                                  default: false, null: false
    t.boolean  "update_pay_manual",                                  default: false, null: false
    t.boolean  "destroy_pay_manual",                                 default: false, null: false
    t.boolean  "manage_pay_manual",                                  default: false, null: false
    t.boolean  "publish_pay_manual",                                 default: false, null: false
    t.boolean  "index_auction_location",                             default: false, null: false
    t.boolean  "show_auction_location",                              default: false, null: false
    t.boolean  "create_auction_location",                            default: false, null: false
    t.boolean  "update_auction_location",                            default: false, null: false
    t.boolean  "destroy_auction_location",                           default: false, null: false
    t.boolean  "manage_auction_location",                            default: false, null: false
    t.boolean  "publish_auction_location",                           default: false, null: false
    t.boolean  "index_groupon_coupon",                               default: false, null: false
    t.boolean  "show_groupon_coupon",                                default: false, null: false
    t.boolean  "create_groupon_coupon",                              default: false, null: false
    t.boolean  "update_groupon_coupon",                              default: false, null: false
    t.boolean  "destroy_groupon_coupon",                             default: false, null: false
    t.boolean  "manage_groupon_coupon",                              default: false, null: false
    t.boolean  "publish_groupon_coupon",                             default: false, null: false
    t.boolean  "index_groupon_group",                                default: false, null: false
    t.boolean  "show_groupon_group",                                 default: false, null: false
    t.boolean  "create_groupon_group",                               default: false, null: false
    t.boolean  "update_groupon_group",                               default: false, null: false
    t.boolean  "destroy_groupon_group",                              default: false, null: false
    t.boolean  "manage_groupon_group",                               default: false, null: false
    t.boolean  "publish_groupon_group",                              default: false, null: false
  end

  add_index "manage_roles", ["active", "id"], name: "by_active_and_id", using: :btree

  create_table "manage_roles_old", force: :cascade do |t|
    t.integer  "user_id",                              limit: 4
    t.string   "name",                                 limit: 255
    t.text     "description",                          limit: 65535
    t.boolean  "show_editor"
    t.boolean  "update_editor"
    t.boolean  "create_editor"
    t.boolean  "destroy_editor"
    t.boolean  "show_role"
    t.boolean  "update_role"
    t.boolean  "create_role"
    t.boolean  "destroy_role"
    t.boolean  "show_core_city"
    t.boolean  "update_core_city"
    t.boolean  "create_core_city"
    t.boolean  "destroy_core_city"
    t.boolean  "show_core_college"
    t.boolean  "update_core_college"
    t.boolean  "create_core_college"
    t.boolean  "destroy_core_college"
    t.boolean  "show_core_network"
    t.boolean  "update_core_network"
    t.boolean  "create_core_network"
    t.boolean  "destroy_core_network"
    t.boolean  "show_core_account"
    t.boolean  "destroy_core_account"
    t.boolean  "show_core_comment"
    t.boolean  "destroy_core_comment"
    t.boolean  "show_core_link"
    t.boolean  "destroy_core_link"
    t.boolean  "show_core_list"
    t.boolean  "destroy_core_list"
    t.boolean  "show_core_report"
    t.boolean  "destroy_core_report"
    t.boolean  "show_core_feed"
    t.boolean  "destroy_core_feed"
    t.boolean  "show_core_user"
    t.boolean  "destroy_core_user"
    t.boolean  "show_blog_note"
    t.boolean  "destroy_blog_note"
    t.boolean  "show_vote_vote"
    t.boolean  "destroy_vote_vote"
    t.boolean  "show_photo_album"
    t.boolean  "destroy_photo_album"
    t.boolean  "show_photo_photo"
    t.boolean  "destroy_photo_photo"
    t.boolean  "active",                                             default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "show_core_keyword"
    t.boolean  "update_core_keyword"
    t.boolean  "create_core_keyword"
    t.boolean  "destroy_core_keyword"
    t.boolean  "show_help_article"
    t.boolean  "update_help_article"
    t.boolean  "create_help_article"
    t.boolean  "destroy_help_article"
    t.boolean  "show_help_category"
    t.boolean  "update_help_category"
    t.boolean  "create_help_category"
    t.boolean  "destroy_help_category"
    t.boolean  "show_circle_photo"
    t.boolean  "destroy_circle_photo"
    t.boolean  "show_core_registration"
    t.boolean  "update_core_registration"
    t.boolean  "create_core_registration"
    t.boolean  "destroy_core_registration"
    t.boolean  "show_core_invitation"
    t.boolean  "destroy_core_invitation"
    t.boolean  "show_core_transaction"
    t.boolean  "update_core_transaction"
    t.boolean  "create_core_transaction"
    t.boolean  "destroy_core_transaction"
    t.boolean  "manage_core_transaction"
    t.boolean  "show_core_stat"
    t.boolean  "destroy_core_stat"
    t.boolean  "manage_editor"
    t.boolean  "manage_role"
    t.boolean  "manage_core_city"
    t.boolean  "manage_core_college"
    t.boolean  "manage_core_network"
    t.boolean  "update_core_account"
    t.boolean  "create_core_account"
    t.boolean  "manage_core_account"
    t.boolean  "update_core_comment"
    t.boolean  "create_core_comment"
    t.boolean  "manage_core_comment"
    t.boolean  "update_core_link"
    t.boolean  "create_core_link"
    t.boolean  "manage_core_link"
    t.boolean  "update_core_list"
    t.boolean  "create_core_list"
    t.boolean  "manage_core_list"
    t.boolean  "update_core_report"
    t.boolean  "create_core_report"
    t.boolean  "manage_core_report"
    t.boolean  "update_core_feed"
    t.boolean  "create_core_feed"
    t.boolean  "manage_core_feed"
    t.boolean  "update_core_user"
    t.boolean  "create_core_user"
    t.boolean  "manage_core_user"
    t.boolean  "update_blog_note"
    t.boolean  "create_blog_note"
    t.boolean  "manage_blog_note"
    t.boolean  "update_vote_vote"
    t.boolean  "create_vote_vote"
    t.boolean  "manage_vote_vote"
    t.boolean  "update_photo_album"
    t.boolean  "create_photo_album"
    t.boolean  "manage_photo_album"
    t.boolean  "update_photo_photo"
    t.boolean  "create_photo_photo"
    t.boolean  "manage_photo_photo"
    t.boolean  "manage_core_keyword"
    t.boolean  "manage_help_article"
    t.boolean  "manage_help_category"
    t.boolean  "update_circle_photo"
    t.boolean  "create_circle_photo"
    t.boolean  "manage_circle_photo"
    t.boolean  "manage_core_registration"
    t.boolean  "update_core_invitation"
    t.boolean  "create_core_invitation"
    t.boolean  "manage_core_invitation"
    t.boolean  "update_core_stat"
    t.boolean  "create_core_stat"
    t.boolean  "manage_core_stat"
    t.boolean  "show_productivity_design_category"
    t.boolean  "update_productivity_design_category"
    t.boolean  "create_productivity_design_category"
    t.boolean  "destroy_productivity_design_category"
    t.boolean  "manage_productivity_design_category"
    t.boolean  "show_productivity_design_image"
    t.boolean  "update_productivity_design_image"
    t.boolean  "create_productivity_design_image"
    t.boolean  "destroy_productivity_design_image"
    t.boolean  "manage_productivity_design_image"
    t.boolean  "show_productivity_design_page"
    t.boolean  "update_productivity_design_page"
    t.boolean  "create_productivity_design_page"
    t.boolean  "destroy_productivity_design_page"
    t.boolean  "manage_productivity_design_page"
    t.boolean  "show_about_article"
    t.boolean  "create_about_article"
    t.boolean  "update_about_article"
    t.boolean  "destroy_about_article"
    t.boolean  "manage_about_article"
    t.boolean  "show_about_person"
    t.boolean  "create_about_person"
    t.boolean  "update_about_person"
    t.boolean  "destroy_about_person"
    t.boolean  "manage_about_person"
    t.boolean  "show_about_job"
    t.boolean  "create_about_job"
    t.boolean  "update_about_job"
    t.boolean  "destroy_about_job"
    t.boolean  "manage_about_job"
    t.boolean  "show_about_link",                                    default: false, null: false
    t.boolean  "create_about_link",                                  default: false, null: false
    t.boolean  "update_about_link",                                  default: false, null: false
    t.boolean  "destroy_about_link",                                 default: false, null: false
    t.boolean  "manage_about_link",                                  default: false, null: false
    t.boolean  "show_grant",                                         default: false, null: false
    t.boolean  "create_grant",                                       default: false, null: false
    t.boolean  "update_grant",                                       default: false, null: false
    t.boolean  "destroy_grant",                                      default: false, null: false
    t.boolean  "index_editor",                                       default: false, null: false
    t.boolean  "publish_editor",                                     default: false, null: false
    t.boolean  "index_role",                                         default: false, null: false
    t.boolean  "publish_role",                                       default: false, null: false
    t.boolean  "index_grant",                                        default: false, null: false
    t.boolean  "publish_grant",                                      default: false, null: false
    t.boolean  "manage_grant",                                       default: false, null: false
    t.boolean  "index_core_city",                                    default: false, null: false
    t.boolean  "publish_core_city",                                  default: false, null: false
    t.boolean  "index_core_college",                                 default: false, null: false
    t.boolean  "publish_core_college",                               default: false, null: false
    t.boolean  "index_core_network",                                 default: false, null: false
    t.boolean  "publish_core_network",                               default: false, null: false
    t.boolean  "index_core_account",                                 default: false, null: false
    t.boolean  "publish_core_account",                               default: false, null: false
    t.boolean  "index_core_comment",                                 default: false, null: false
    t.boolean  "publish_core_comment",                               default: false, null: false
    t.boolean  "index_core_link",                                    default: false, null: false
    t.boolean  "publish_core_link",                                  default: false, null: false
    t.boolean  "index_core_list",                                    default: false, null: false
    t.boolean  "publish_core_list",                                  default: false, null: false
    t.boolean  "index_core_report",                                  default: false, null: false
    t.boolean  "publish_core_report",                                default: false, null: false
    t.boolean  "index_core_feed",                                    default: false, null: false
    t.boolean  "publish_core_feed",                                  default: false, null: false
    t.boolean  "index_core_user",                                    default: false, null: false
    t.boolean  "publish_core_user",                                  default: false, null: false
    t.boolean  "index_blog_note",                                    default: false, null: false
    t.boolean  "publish_blog_note",                                  default: false, null: false
    t.boolean  "index_vote_vote",                                    default: false, null: false
    t.boolean  "publish_vote_vote",                                  default: false, null: false
    t.boolean  "index_photo_album",                                  default: false, null: false
    t.boolean  "publish_photo_album",                                default: false, null: false
    t.boolean  "index_photo_photo",                                  default: false, null: false
    t.boolean  "publish_photo_photo",                                default: false, null: false
    t.boolean  "index_core_keyword",                                 default: false, null: false
    t.boolean  "publish_core_keyword",                               default: false, null: false
    t.boolean  "index_help_article",                                 default: false, null: false
    t.boolean  "publish_help_article",                               default: false, null: false
    t.boolean  "index_help_category",                                default: false, null: false
    t.boolean  "publish_help_category",                              default: false, null: false
    t.boolean  "index_circle_photo",                                 default: false, null: false
    t.boolean  "publish_circle_photo",                               default: false, null: false
    t.boolean  "index_core_registration",                            default: false, null: false
    t.boolean  "publish_core_registration",                          default: false, null: false
    t.boolean  "index_core_invitation",                              default: false, null: false
    t.boolean  "publish_core_invitation",                            default: false, null: false
    t.boolean  "index_core_transaction",                             default: false, null: false
    t.boolean  "publish_core_transaction",                           default: false, null: false
    t.boolean  "index_core_stat",                                    default: false, null: false
    t.boolean  "publish_core_stat",                                  default: false, null: false
    t.boolean  "index_productivity_design_category",                 default: false, null: false
    t.boolean  "publish_productivity_design_category",               default: false, null: false
    t.boolean  "index_productivity_design_image",                    default: false, null: false
    t.boolean  "publish_productivity_design_image",                  default: false, null: false
    t.boolean  "index_productivity_design_page",                     default: false, null: false
    t.boolean  "publish_productivity_design_page",                   default: false, null: false
    t.boolean  "index_about_article",                                default: false, null: false
    t.boolean  "publish_about_article",                              default: false, null: false
    t.boolean  "index_about_job",                                    default: false, null: false
    t.boolean  "publish_about_job",                                  default: false, null: false
    t.boolean  "index_about_person",                                 default: false, null: false
    t.boolean  "publish_about_person",                               default: false, null: false
    t.boolean  "index_about_link",                                   default: false, null: false
    t.boolean  "publish_about_link",                                 default: false, null: false
    t.boolean  "index_develop_document_editor",                      default: false, null: false
    t.boolean  "show_develop_document_editor",                       default: false, null: false
    t.boolean  "create_develop_document_editor",                     default: false, null: false
    t.boolean  "update_develop_document_editor",                     default: false, null: false
    t.boolean  "destroy_develop_document_editor",                    default: false, null: false
    t.boolean  "manage_develop_document_editor",                     default: false, null: false
    t.boolean  "publish_develop_document_editor",                    default: false, null: false
    t.boolean  "index_develop_document_role",                        default: false, null: false
    t.boolean  "show_develop_document_role",                         default: false, null: false
    t.boolean  "create_develop_document_role",                       default: false, null: false
    t.boolean  "update_develop_document_role",                       default: false, null: false
    t.boolean  "destroy_develop_document_role",                      default: false, null: false
    t.boolean  "manage_develop_document_role",                       default: false, null: false
    t.boolean  "publish_develop_document_role",                      default: false, null: false
    t.boolean  "index_search_brand",                                 default: false, null: false
    t.boolean  "show_search_brand",                                  default: false, null: false
    t.boolean  "create_search_brand",                                default: false, null: false
    t.boolean  "update_search_brand",                                default: false, null: false
    t.boolean  "destroy_search_brand",                               default: false, null: false
    t.boolean  "manage_search_brand",                                default: false, null: false
    t.boolean  "publish_search_brand",                               default: false, null: false
    t.boolean  "index_search_brand_mapping",                         default: false, null: false
    t.boolean  "show_search_brand_mapping",                          default: false, null: false
    t.boolean  "create_search_brand_mapping",                        default: false, null: false
    t.boolean  "update_search_brand_mapping",                        default: false, null: false
    t.boolean  "destroy_search_brand_mapping",                       default: false, null: false
    t.boolean  "manage_search_brand_mapping",                        default: false, null: false
    t.boolean  "publish_search_brand_mapping",                       default: false, null: false
    t.boolean  "index_search_category",                              default: false, null: false
    t.boolean  "show_search_category",                               default: false, null: false
    t.boolean  "create_search_category",                             default: false, null: false
    t.boolean  "update_search_category",                             default: false, null: false
    t.boolean  "destroy_search_category",                            default: false, null: false
    t.boolean  "manage_search_category",                             default: false, null: false
    t.boolean  "publish_search_category",                            default: false, null: false
    t.boolean  "index_search_category_mapping",                      default: false, null: false
    t.boolean  "show_search_category_mapping",                       default: false, null: false
    t.boolean  "create_search_category_mapping",                     default: false, null: false
    t.boolean  "update_search_category_mapping",                     default: false, null: false
    t.boolean  "destroy_search_category_mapping",                    default: false, null: false
    t.boolean  "manage_search_category_mapping",                     default: false, null: false
    t.boolean  "publish_search_category_mapping",                    default: false, null: false
    t.boolean  "index_search_editor",                                default: false, null: false
    t.boolean  "show_search_editor",                                 default: false, null: false
    t.boolean  "create_search_editor",                               default: false, null: false
    t.boolean  "update_search_editor",                               default: false, null: false
    t.boolean  "destroy_search_editor",                              default: false, null: false
    t.boolean  "manage_search_editor",                               default: false, null: false
    t.boolean  "publish_search_editor",                              default: false, null: false
    t.boolean  "index_search_mall",                                  default: false, null: false
    t.boolean  "show_search_mall",                                   default: false, null: false
    t.boolean  "create_search_mall",                                 default: false, null: false
    t.boolean  "update_search_mall",                                 default: false, null: false
    t.boolean  "destroy_search_mall",                                default: false, null: false
    t.boolean  "manage_search_mall",                                 default: false, null: false
    t.boolean  "publish_search_mall",                                default: false, null: false
    t.boolean  "index_search_product",                               default: false, null: false
    t.boolean  "show_search_product",                                default: false, null: false
    t.boolean  "create_search_product",                              default: false, null: false
    t.boolean  "update_search_product",                              default: false, null: false
    t.boolean  "destroy_search_product",                             default: false, null: false
    t.boolean  "manage_search_product",                              default: false, null: false
    t.boolean  "publish_search_product",                             default: false, null: false
  end

  add_index "manage_roles_old", ["active"], name: "index_manage_roles_on_active", using: :btree
  add_index "manage_roles_old", ["created_at"], name: "index_manage_roles_on_created_at", using: :btree
  add_index "manage_roles_old", ["destroyed_at"], name: "index_manage_roles_on_destroyed_at", using: :btree
  add_index "manage_roles_old", ["updated_at"], name: "index_manage_roles_on_updated_at", using: :btree
  add_index "manage_roles_old", ["user_id"], name: "index_manage_roles_on_user_id", using: :btree

  create_table "manage_users", force: :cascade do |t|
    t.string   "pic",        limit: 255
    t.string   "name",       limit: 20
    t.string   "sex",        limit: 20
    t.date     "birthday"
    t.text     "friend_ids", limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "manage_users", ["birthday"], name: "index_manage_users_on_birthday", using: :btree
  add_index "manage_users", ["created_at"], name: "index_manage_users_on_created_at", using: :btree
  add_index "manage_users", ["id"], name: "index_manage_users_on_id", using: :btree
  add_index "manage_users", ["login_at"], name: "index_manage_users_on_login_at", using: :btree
  add_index "manage_users", ["updated_at"], name: "index_manage_users_on_updated_at", using: :btree

  create_table "notifications", force: :cascade do |t|
    t.string   "message_type",   limit: 255
    t.string   "content",        limit: 255
    t.string   "deeplink",       limit: 255
    t.text     "target_users",   limit: 65535
    t.integer  "open_num",       limit: 4
    t.integer  "push_num",       limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "target_devices", limit: 65535
  end

  create_table "office_finance_currencies", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "abbreviation", limit: 255
    t.text     "description",  limit: 65535
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "office_finance_exchange_rates", force: :cascade do |t|
    t.integer  "from_currency_id", limit: 4
    t.integer  "to_currency_id",   limit: 4
    t.decimal  "value",                      precision: 11, scale: 6
    t.datetime "started_at"
    t.boolean  "active",                                              default: true, null: false
    t.integer  "creator_id",       limit: 4
    t.integer  "updater_id",       limit: 4
    t.integer  "lock_version",     limit: 4,                          default: 0,    null: false
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  create_table "office_human_companies", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.integer  "parent_id",    limit: 4
    t.datetime "created_at",                                null: false
    t.datetime "updated_at",                                null: false
  end

  create_table "office_human_departments", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.string   "english_name",     limit: 255
    t.text     "description",      limit: 65535
    t.integer  "administrator_id", limit: 4
    t.integer  "parent_id",        limit: 4
    t.integer  "company_id",       limit: 4
    t.integer  "creator_id",       limit: 4
    t.integer  "updater_id",       limit: 4
    t.boolean  "active",                         default: true, null: false
    t.integer  "lock_version",     limit: 4,     default: 0,    null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
  end

  create_table "office_human_employees", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.string   "identifier",      limit: 255
    t.string   "mobile_phone",    limit: 255
    t.string   "fixed_phone",     limit: 255
    t.integer  "department_id",   limit: 4
    t.integer  "company_id",      limit: 4
    t.integer  "gender",          limit: 4
    t.integer  "number",          limit: 4
    t.integer  "status",          limit: 4
    t.date     "joined_on"
    t.date     "formalized_on"
    t.string   "position_name",   limit: 255
    t.string   "city_name",       limit: 255
    t.boolean  "active",                      default: true, null: false
    t.integer  "lock_version",    limit: 4,   default: 0,    null: false
    t.integer  "probation_month", limit: 4
    t.integer  "creator_id",      limit: 4
    t.integer  "updater_id",      limit: 4
    t.date     "resigned_on"
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "seat_name",       limit: 255
  end

  create_table "office_purchase_applications", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.text     "description",            limit: 65535
    t.integer  "result",                 limit: 4
    t.integer  "level",                  limit: 4
    t.integer  "company_id",             limit: 4
    t.integer  "department_id",          limit: 4
    t.integer  "currency_id",            limit: 4
    t.integer  "reviewer_id",            limit: 4
    t.integer  "buyer_id",               limit: 4
    t.integer  "specified_quotation_id", limit: 4
    t.decimal  "total_price",                          precision: 11, scale: 2
    t.integer  "creator_id",             limit: 4
    t.integer  "lock_version",           limit: 4,                              default: 0,    null: false
    t.boolean  "active",                                                        default: true, null: false
    t.string   "identifier",             limit: 255
    t.datetime "created_at",                                                                   null: false
    t.datetime "updated_at",                                                                   null: false
  end

  create_table "office_purchase_demands", force: :cascade do |t|
    t.integer  "application_id", limit: 4
    t.string   "name",           limit: 255
    t.string   "description",    limit: 255
    t.string   "location",       limit: 255
    t.decimal  "price",                      precision: 11, scale: 2
    t.integer  "quantity",       limit: 4
    t.integer  "lock_version",   limit: 4,                            default: 0,    null: false
    t.boolean  "active",                                              default: true, null: false
    t.datetime "created_at",                                                         null: false
    t.datetime "updated_at",                                                         null: false
  end

  create_table "office_purchase_providers", force: :cascade do |t|
    t.string   "identifier",   limit: 255
    t.string   "name",         limit: 255
    t.integer  "lock_version", limit: 4,   default: 0,    null: false
    t.boolean  "active",                   default: true, null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "office_purchase_quotations", force: :cascade do |t|
    t.integer  "application_id",          limit: 4
    t.integer  "provider_id",             limit: 4
    t.date     "quoted_on"
    t.string   "attachment",              limit: 255
    t.string   "attachment_file_name",    limit: 255
    t.integer  "attachment_file_size",    limit: 4
    t.string   "attachment_content_type", limit: 255
    t.datetime "attachment_updated_at"
    t.text     "payment_condition",       limit: 65535
    t.text     "choosing_reason",         limit: 65535
    t.text     "exclusive_reason",        limit: 65535
    t.integer  "lock_version",            limit: 4,     default: 0, null: false
    t.integer  "active",                  limit: 4,     default: 1, null: false
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  create_table "office_purchase_quotations_demands", force: :cascade do |t|
    t.integer  "quotation_id", limit: 4
    t.integer  "demand_id",    limit: 4
    t.decimal  "price",                  precision: 11, scale: 2
    t.integer  "quantity",     limit: 4
    t.integer  "lock_version", limit: 4,                          default: 0, null: false
    t.integer  "active",       limit: 4,                          default: 1, null: false
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
  end

  create_table "office_purchase_reviews", force: :cascade do |t|
    t.integer  "application_id", limit: 4
    t.integer  "user_id",        limit: 4
    t.integer  "result",         limit: 4
    t.text     "opinion",        limit: 65535
    t.integer  "lock_version",   limit: 4,     default: 0, null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  create_table "pay_behaviors", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.text     "description",       limit: 65535
    t.string   "icon",              limit: 255
    t.string   "icon_file_name",    limit: 255
    t.integer  "icon_file_size",    limit: 4
    t.string   "icon_content_type", limit: 255
    t.datetime "icon_updated_at"
    t.integer  "icon_image_width",  limit: 4
    t.integer  "icon_image_height", limit: 4
    t.integer  "creator_id",        limit: 4
    t.integer  "updater_id",        limit: 4
    t.boolean  "active",                          default: true
    t.integer  "lock_version",      limit: 4,     default: 0
    t.datetime "created_at",                                     null: false
    t.datetime "updated_at",                                     null: false
  end

  create_table "pay_cards", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "number",       limit: 255
    t.string   "name",         limit: 255
    t.string   "bank",         limit: 255
    t.string   "branch",       limit: 255
    t.string   "province",     limit: 255
    t.string   "city",         limit: 255
    t.string   "phone",        limit: 255
    t.datetime "deleted_at"
    t.integer  "lock_version", limit: 4,   default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  add_index "pay_cards", ["deleted_at"], name: "index_pay_cards_on_deleted_at", using: :btree
  add_index "pay_cards", ["number"], name: "index_pay_cards_on_number", using: :btree
  add_index "pay_cards", ["user_id"], name: "index_pay_cards_on_user_id", using: :btree

  create_table "pay_cashiers", force: :cascade do |t|
    t.integer  "merchant_id",  limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.boolean  "published",                default: false, null: false
    t.boolean  "active",                   default: true,  null: false
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.integer  "lock_version", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "pay_cashiers", ["merchant_id"], name: "index_pay_cashiers_on_merchant_id", using: :btree
  add_index "pay_cashiers", ["user_id"], name: "index_pay_cashiers_on_user_id", using: :btree

  create_table "pay_checkouts", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "key",          limit: 255
    t.integer  "lock_version", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "client",       limit: 255
    t.string   "version",      limit: 255
  end

  add_index "pay_checkouts", ["user_id"], name: "index_pay_checkouts_on_user_id", using: :btree

  create_table "pay_cities", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                     default: true
    t.boolean  "published",                  default: false
    t.integer  "lock_version", limit: 4,     default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.string   "english_name", limit: 255
  end

  create_table "pay_counters", force: :cascade do |t|
    t.integer  "merchant_id",  limit: 4
    t.string   "name",         limit: 255
    t.string   "identifier",   limit: 255
    t.integer  "cashier_id",   limit: 4
    t.boolean  "published",                default: false, null: false
    t.boolean  "active",                   default: true,  null: false
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.integer  "lock_version", limit: 4
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
  end

  add_index "pay_counters", ["cashier_id"], name: "index_pay_counters_on_cashier_id", using: :btree
  add_index "pay_counters", ["merchant_id"], name: "index_pay_counters_on_merchant_id", using: :btree

  create_table "pay_deals", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.integer  "city_id",         limit: 4
    t.integer  "mall_id",         limit: 4
    t.integer  "merchant_id",     limit: 4
    t.integer  "product_id",      limit: 4
    t.integer  "period",          limit: 4
    t.integer  "creator_id",      limit: 4
    t.integer  "updater_id",      limit: 4
    t.boolean  "active",                        default: true
    t.boolean  "published",                     default: false
    t.integer  "lock_version",    limit: 4,     default: 0
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.text     "description",     limit: 65535
    t.integer  "times",           limit: 4
    t.integer  "gift_limitation", limit: 4
  end

  add_index "pay_deals", ["city_id"], name: "index_pay_deals_on_city_id", using: :btree
  add_index "pay_deals", ["mall_id"], name: "index_pay_deals_on_mall_id", using: :btree
  add_index "pay_deals", ["merchant_id"], name: "index_pay_deals_on_merchant_id", using: :btree
  add_index "pay_deals", ["product_id"], name: "index_pay_deals_on_product_id", using: :btree

  create_table "pay_exchanges", force: :cascade do |t|
    t.integer  "rate_id",        limit: 4
    t.integer  "user_id",        limit: 4
    t.integer  "transfer_id",    limit: 4
    t.integer  "quantity",       limit: 4
    t.integer  "lock_version",   limit: 4, default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "transaction_id", limit: 4
  end

  add_index "pay_exchanges", ["rate_id"], name: "index_pay_exchanges_on_rate_id", using: :btree
  add_index "pay_exchanges", ["transfer_id"], name: "index_pay_exchanges_on_transfer_id", using: :btree
  add_index "pay_exchanges", ["user_id"], name: "index_pay_exchanges_on_user_id", using: :btree

  create_table "pay_industries", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                   default: true, null: false
    t.integer  "lock_version", limit: 4,   default: 0,    null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "pay_levels", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "limitation",   limit: 4
    t.boolean  "active",                     default: true,  null: false
    t.boolean  "published",                  default: false, null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "pay_malls", force: :cascade do |t|
    t.integer  "city_id",      limit: 4
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                     default: true
    t.boolean  "published",                  default: false
    t.integer  "lock_version", limit: 4,     default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  add_index "pay_malls", ["city_id"], name: "index_pay_malls_on_city_id", using: :btree

  create_table "pay_manuals", force: :cascade do |t|
    t.integer  "record",     limit: 4
    t.integer  "city_id",    limit: 4
    t.string   "name",       limit: 255
    t.text     "content",    limit: 65535
    t.text     "remark",     limit: 65535
    t.integer  "creator_id", limit: 4
    t.integer  "updater_id", limit: 4
    t.boolean  "active",                   default: true
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "pay_merchants", force: :cascade do |t|
    t.integer  "user_id",                     limit: 4
    t.string   "key",                         limit: 255
    t.string   "name",                        limit: 255
    t.text     "description",                 limit: 65535
    t.string   "business_licence",            limit: 255
    t.string   "business_term",               limit: 255
    t.string   "address",                     limit: 255
    t.string   "phone_number",                limit: 255
    t.string   "fax_number",                  limit: 255
    t.string   "deposit_bank_name",           limit: 255
    t.string   "deposit_bank_location",       limit: 255
    t.string   "deposit_bank_branch",         limit: 255
    t.string   "deposit_bank_account",        limit: 255
    t.string   "representative_name",         limit: 255
    t.string   "representative_location",     limit: 255
    t.string   "representative_identifier",   limit: 255
    t.string   "representative_phone_number", limit: 255
    t.integer  "creator_id",                  limit: 4
    t.integer  "updater_id",                  limit: 4
    t.boolean  "published",                                 default: false
    t.integer  "lock_version",                limit: 4,     default: 0
    t.datetime "created_at",                                                null: false
    t.datetime "updated_at",                                                null: false
    t.integer  "mall_id",                     limit: 4
    t.integer  "city_id",                     limit: 4
    t.boolean  "active",                                    default: true
    t.integer  "industry_id",                 limit: 4
    t.boolean  "transaction_permission",                    default: false, null: false
    t.boolean  "order_permission",                          default: false, null: false
    t.boolean  "refundment_permission",                     default: false, null: false
    t.boolean  "ticket_permission",                         default: false, null: false
    t.integer  "daily_usage_quota",           limit: 4
    t.integer  "each_usage_quota",            limit: 4
    t.integer  "each_bonus_quota",            limit: 4
    t.string   "identifier",                  limit: 255
    t.boolean  "activating_permission",                     default: false, null: false
    t.integer  "interface_type",              limit: 4
    t.float    "each_usage_percentage",       limit: 24
  end

  add_index "pay_merchants", ["city_id"], name: "index_pay_merchants_on_city_id", using: :btree
  add_index "pay_merchants", ["mall_id"], name: "index_pay_merchants_on_mall_id", using: :btree
  add_index "pay_merchants", ["user_id"], name: "index_pay_merchants_on_user_id", using: :btree

  create_table "pay_orders", force: :cascade do |t|
    t.integer  "user_id",              limit: 4
    t.integer  "merchant_id",          limit: 4
    t.string   "name",                 limit: 255
    t.string   "number",               limit: 255
    t.integer  "value",                limit: 4
    t.string   "key",                  limit: 255
    t.string   "applied_at",           limit: 255
    t.integer  "lock_version",         limit: 4,   default: 0
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "receipt",              limit: 255
    t.string   "receipt_file_name",    limit: 255
    t.integer  "receipt_file_size",    limit: 4
    t.string   "receipt_content_type", limit: 255
    t.datetime "receipt_updated_at"
    t.integer  "receipt_image_width",  limit: 4
    t.integer  "receipt_image_height", limit: 4
    t.integer  "store_id",             limit: 4
    t.integer  "checkout_id",          limit: 4
    t.integer  "counter_id",           limit: 4
    t.integer  "cashier_id",           limit: 4
    t.integer  "usage",                limit: 4
    t.integer  "bonus",                limit: 4
    t.string   "serial",               limit: 255
    t.integer  "status",               limit: 4
    t.integer  "payment_price",        limit: 4
  end

  add_index "pay_orders", ["checkout_id"], name: "index_pay_orders_on_checkout_id", using: :btree
  add_index "pay_orders", ["created_at"], name: "index_pay_orders_on_created_at", using: :btree
  add_index "pay_orders", ["merchant_id", "number"], name: "index_pay_orders_on_merchant_id_and_number", using: :btree
  add_index "pay_orders", ["status"], name: "index_pay_orders_on_status", using: :btree
  add_index "pay_orders", ["user_id", "status", "created_at"], name: "index_pay_orders_on_user_id_and_status_and_created_at", using: :btree
  add_index "pay_orders", ["user_id"], name: "index_pay_orders_on_user_id", using: :btree

  create_table "pay_rates", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description",         limit: 65535
    t.string   "banner",              limit: 255
    t.string   "banner_file_name",    limit: 255
    t.string   "banner_content_type", limit: 255
    t.integer  "banner_file_size",    limit: 4
    t.datetime "banner_updated_at"
    t.integer  "banner_image_width",  limit: 4
    t.integer  "banner_image_height", limit: 4
    t.string   "icon",                limit: 255
    t.string   "icon_file_name",      limit: 255
    t.string   "icon_content_type",   limit: 255
    t.integer  "icon_file_size",      limit: 4
    t.datetime "icon_updated_at"
    t.integer  "icon_image_width",    limit: 4
    t.integer  "icon_image_height",   limit: 4
    t.integer  "u",                   limit: 4
    t.integer  "cash",                limit: 4
    t.integer  "total",               limit: 4
    t.integer  "remainder",           limit: 4
    t.integer  "level_id",            limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.boolean  "published",                         default: false, null: false
    t.integer  "lock_version",        limit: 4,     default: 0,     null: false
    t.datetime "deleted_at"
    t.integer  "creator_id",          limit: 4
    t.integer  "updater_id",          limit: 4
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.integer  "city_id",             limit: 4
  end

  add_index "pay_rates", ["city_id"], name: "index_pay_rates_on_city_id", using: :btree
  add_index "pay_rates", ["deleted_at"], name: "index_pay_rates_on_deleted_at", using: :btree

  create_table "pay_refundments", force: :cascade do |t|
    t.integer  "checkout_id",  limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "merchant_id",  limit: 4
    t.integer  "store_id",     limit: 4
    t.integer  "counter_id",   limit: 4
    t.integer  "cashier_id",   limit: 4
    t.string   "number",       limit: 255
    t.string   "serial",       limit: 255
    t.integer  "value",        limit: 4
    t.integer  "usage",        limit: 4
    t.integer  "bonus",        limit: 4
    t.integer  "lock_version", limit: 4
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.integer  "margin",       limit: 4
    t.integer  "status",       limit: 4
  end

  add_index "pay_refundments", ["cashier_id"], name: "index_pay_refundments_on_cashier_id", using: :btree
  add_index "pay_refundments", ["checkout_id"], name: "index_pay_refundments_on_checkout_id", using: :btree
  add_index "pay_refundments", ["counter_id"], name: "index_pay_refundments_on_counter_id", using: :btree
  add_index "pay_refundments", ["created_at"], name: "index_pay_refundments_on_created_at", using: :btree
  add_index "pay_refundments", ["merchant_id"], name: "index_pay_refundments_on_merchant_id", using: :btree
  add_index "pay_refundments", ["status"], name: "index_pay_refundments_on_status", using: :btree
  add_index "pay_refundments", ["store_id"], name: "index_pay_refundments_on_store_id", using: :btree
  add_index "pay_refundments", ["user_id", "status", "created_at"], name: "index_pay_refundments_on_user_id_and_status_and_created_at", using: :btree
  add_index "pay_refundments", ["user_id"], name: "index_pay_refundments_on_user_id", using: :btree

  create_table "pay_stores", force: :cascade do |t|
    t.string   "name",              limit: 255
    t.integer  "merchant_id",       limit: 4
    t.integer  "industry_id",       limit: 4
    t.integer  "creator_id",        limit: 4
    t.integer  "updater_id",        limit: 4
    t.boolean  "active",                        default: true,  null: false
    t.boolean  "published",                     default: false, null: false
    t.integer  "lock_version",      limit: 4,   default: 0,     null: false
    t.datetime "created_at",                                    null: false
    t.datetime "updated_at",                                    null: false
    t.integer  "daily_usage_quota", limit: 4
    t.integer  "each_usage_quota",  limit: 4
    t.integer  "each_bonus_quota",  limit: 4
    t.string   "identifier",        limit: 255
    t.string   "abbreviation",      limit: 255
  end

  create_table "pay_tickets", force: :cascade do |t|
    t.integer  "deal_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "merchant_id",  limit: 4
    t.string   "key",          limit: 255
    t.datetime "applied_at"
    t.datetime "expires_at"
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "store_id",     limit: 4
    t.integer  "counter_id",   limit: 4
    t.integer  "cashier_id",   limit: 4
    t.integer  "status",       limit: 4
    t.integer  "creator_id",   limit: 4
  end

  add_index "pay_tickets", ["cashier_id"], name: "index_pay_tickets_on_cashier_id", using: :btree
  add_index "pay_tickets", ["counter_id"], name: "index_pay_tickets_on_counter_id", using: :btree
  add_index "pay_tickets", ["deal_id"], name: "index_pay_tickets_on_deal_id", using: :btree
  add_index "pay_tickets", ["merchant_id"], name: "index_pay_tickets_on_merchant_id", using: :btree
  add_index "pay_tickets", ["user_id"], name: "index_pay_tickets_on_user_id", using: :btree

  create_table "pay_transactions", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "merchant_id",  limit: 4
    t.integer  "trade_id",     limit: 4
    t.integer  "value",        limit: 4
    t.integer  "balance",      limit: 4
    t.string   "trade_name",   limit: 255
    t.integer  "category",     limit: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.string   "remark",       limit: 255
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "order_id",     limit: 4
    t.string   "order_number", limit: 255
    t.integer  "behavior_id",  limit: 4
    t.string   "name",         limit: 255
    t.datetime "expires_at"
    t.integer  "store_id",     limit: 4
    t.integer  "counter_id",   limit: 4
    t.integer  "cashier_id",   limit: 4
    t.integer  "creator_id",   limit: 4
  end

  add_index "pay_transactions", ["behavior_id"], name: "index_pay_transactions_on_behavior_id", using: :btree
  add_index "pay_transactions", ["created_at"], name: "index_pay_transactions_on_created_at", using: :btree
  add_index "pay_transactions", ["merchant_id"], name: "index_pay_transactions_on_merchant_id", using: :btree
  add_index "pay_transactions", ["order_id", "user_id"], name: "index_pay_transactions_on_order_id_and_user_id", using: :btree
  add_index "pay_transactions", ["order_id"], name: "index_pay_transactions_on_order_id", using: :btree
  add_index "pay_transactions", ["user_id", "expires_at"], name: "index_pay_transactions_on_user_id_and_expires_at", using: :btree
  add_index "pay_transactions", ["user_id"], name: "index_pay_transactions_on_user_id", using: :btree

  create_table "pay_transfers", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "card_id",       limit: 4
    t.string   "number",        limit: 255
    t.string   "bank",          limit: 255
    t.string   "name",          limit: 255
    t.string   "branch",        limit: 255
    t.string   "province",      limit: 255
    t.string   "city",          limit: 255
    t.string   "phone",         limit: 255
    t.integer  "value",         limit: 4
    t.integer  "accountant_id", limit: 4
    t.integer  "status",        limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "pay_transfers", ["card_id"], name: "index_pay_transfers_on_card_id", using: :btree
  add_index "pay_transfers", ["status"], name: "index_pay_transfers_on_status", using: :btree
  add_index "pay_transfers", ["user_id"], name: "index_pay_transfers_on_user_id", using: :btree

  create_table "pay_users", force: :cascade do |t|
    t.string   "name",                   limit: 255
    t.string   "sex",                    limit: 255
    t.string   "pic",                    limit: 255
    t.integer  "balance",                limit: 4
    t.datetime "transaction_expires_at"
    t.integer  "lock_version",           limit: 4,   default: 0
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.string   "phone",                  limit: 255
    t.integer  "credit",                 limit: 4
    t.integer  "debit",                  limit: 4
    t.integer  "level_id",               limit: 4
    t.boolean  "special_0",                          default: false, null: false
    t.datetime "activated_at"
  end

  add_index "pay_users", ["level_id"], name: "index_pay_users_on_level_id", using: :btree

  create_table "pay_users_updatings", force: :cascade do |t|
    t.integer  "user_id",       limit: 4
    t.integer  "level_id",      limit: 4
    t.integer  "pre_level_id",  limit: 4
    t.integer  "order_id",      limit: 4
    t.integer  "refundment_id", limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "photo_albums", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
    t.string   "privacy",      limit: 255
    t.string   "pic",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.text     "geolocation",  limit: 65535
    t.string   "thumbnails",   limit: 255
    t.integer  "photos_count", limit: 4,     default: 0
  end

  add_index "photo_albums", ["active"], name: "index_photo_albums_on_active", using: :btree
  add_index "photo_albums", ["created_at"], name: "index_photo_albums_on_created_at", using: :btree
  add_index "photo_albums", ["destroyed_at"], name: "index_photo_albums_on_destroyed_at", using: :btree
  add_index "photo_albums", ["feed_id"], name: "index_photo_albums_on_feed_id", using: :btree
  add_index "photo_albums", ["photos_count"], name: "index_photo_albums_on_photos_count", using: :btree
  add_index "photo_albums", ["updated_at"], name: "index_photo_albums_on_updated_at", using: :btree
  add_index "photo_albums", ["user_id"], name: "index_photo_albums_on_user_id", using: :btree

  create_table "photo_albums_readings", force: :cascade do |t|
    t.integer  "album_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_albums_readings", ["album_id"], name: "index_photo_albums_readings_on_album_id", using: :btree
  add_index "photo_albums_readings", ["created_at"], name: "index_photo_albums_readings_on_created_at", using: :btree
  add_index "photo_albums_readings", ["updated_at"], name: "index_photo_albums_readings_on_updated_at", using: :btree
  add_index "photo_albums_readings", ["user_id"], name: "index_photo_albums_readings_on_user_id", using: :btree

  create_table "photo_albums_updatings", force: :cascade do |t|
    t.integer  "album_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_albums_updatings", ["album_id"], name: "index_photo_albums_updatings_on_album_id", using: :btree
  add_index "photo_albums_updatings", ["created_at"], name: "index_photo_albums_updatings_on_created_at", using: :btree
  add_index "photo_albums_updatings", ["updated_at"], name: "index_photo_albums_updatings_on_updated_at", using: :btree

  create_table "photo_photos", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.integer  "album_id",     limit: 4
    t.string   "title",        limit: 255
    t.string   "pic",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.text     "description",  limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.string   "pic_info",     limit: 1000,  default: "{}"
    t.text     "pic_exif",     limit: 65535
  end

  add_index "photo_photos", ["active"], name: "index_photo_photos_on_active", using: :btree
  add_index "photo_photos", ["album_id"], name: "index_photo_photos_on_album_id", using: :btree
  add_index "photo_photos", ["created_at"], name: "index_photo_photos_on_created_at", using: :btree
  add_index "photo_photos", ["destroyed_at"], name: "index_photo_photos_on_destroyed_at", using: :btree
  add_index "photo_photos", ["feed_id"], name: "index_photo_photos_on_feed_id", using: :btree
  add_index "photo_photos", ["updated_at"], name: "index_photo_photos_on_updated_at", using: :btree
  add_index "photo_photos", ["user_id"], name: "index_photo_photos_on_user_id", using: :btree

  create_table "photo_photos_readings", force: :cascade do |t|
    t.integer  "photo_id",   limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_photos_readings", ["created_at"], name: "index_photo_photos_readings_on_created_at", using: :btree
  add_index "photo_photos_readings", ["photo_id"], name: "index_photo_photos_readings_on_photo_id", using: :btree
  add_index "photo_photos_readings", ["updated_at"], name: "index_photo_photos_readings_on_updated_at", using: :btree
  add_index "photo_photos_readings", ["user_id"], name: "index_photo_photos_readings_on_user_id", using: :btree

  create_table "photo_photos_updatings", force: :cascade do |t|
    t.integer  "photo_id",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_photos_updatings", ["created_at"], name: "index_photo_photos_updatings_on_created_at", using: :btree
  add_index "photo_photos_updatings", ["photo_id"], name: "index_photo_photos_updatings_on_photo_id", using: :btree
  add_index "photo_photos_updatings", ["updated_at"], name: "index_photo_photos_updatings_on_updated_at", using: :btree

  create_table "photo_relations", force: :cascade do |t|
    t.integer  "photo_id",     limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.string   "position",     limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "active",                   default: true
    t.datetime "destroyed_at"
  end

  add_index "photo_relations", ["active"], name: "index_photo_relations_on_active", using: :btree
  add_index "photo_relations", ["created_at"], name: "index_photo_relations_on_created_at", using: :btree
  add_index "photo_relations", ["destroyed_at"], name: "index_photo_relations_on_destroyed_at", using: :btree
  add_index "photo_relations", ["photo_id"], name: "index_photo_relations_on_photo_id", using: :btree
  add_index "photo_relations", ["updated_at"], name: "index_photo_relations_on_updated_at", using: :btree
  add_index "photo_relations", ["user_id"], name: "index_photo_relations_on_user_id", using: :btree

  create_table "photo_relations_updatings", force: :cascade do |t|
    t.integer  "relation_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "photo_relations_updatings", ["created_at"], name: "index_photo_relations_updatings_on_created_at", using: :btree
  add_index "photo_relations_updatings", ["relation_id"], name: "index_photo_relations_updatings_on_relation_id", using: :btree
  add_index "photo_relations_updatings", ["updated_at"], name: "index_photo_relations_updatings_on_updated_at", using: :btree

  create_table "photo_users", force: :cascade do |t|
    t.string   "pic",           limit: 255
    t.string   "name",          limit: 20
    t.string   "sex",           limit: 20
    t.date     "birthday"
    t.text     "friend_ids",    limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "head_album_id", limit: 4
    t.integer  "feed_album_id", limit: 4
  end

  add_index "photo_users", ["birthday"], name: "index_photo_users_on_birthday", using: :btree
  add_index "photo_users", ["created_at"], name: "index_photo_users_on_created_at", using: :btree
  add_index "photo_users", ["login_at"], name: "index_photo_users_on_login_at", using: :btree
  add_index "photo_users", ["updated_at"], name: "index_photo_users_on_updated_at", using: :btree

  create_table "ppho", primary_key: "aid", force: :cascade do |t|
    t.boolean "active",                         default: true
    t.integer "id",                 limit: 4,   default: 0,    null: false
    t.integer "user_id",            limit: 4
    t.string  "name",               limit: 255
    t.string  "keywords",           limit: 255
    t.integer "category_id",        limit: 4
    t.string  "relate_product_ids", limit: 255
    t.integer "market_id",          limit: 4
    t.string  "rec_pic",            limit: 255
  end

  create_table "productivity_design_categories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "parent_id",    limit: 4
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "productivity_design_images", force: :cascade do |t|
    t.string   "name",             limit: 255
    t.integer  "version",          limit: 4
    t.string   "pic",              limit: 255
    t.string   "psd",              limit: 255
    t.text     "description",      limit: 65535
    t.integer  "page_id",          limit: 4
    t.integer  "editor_id",        limit: 4
    t.boolean  "active",                         default: true, null: false
    t.integer  "lock_version",     limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic_file_name",    limit: 255
    t.string   "pic_content_type", limit: 255
    t.integer  "pic_file_size",    limit: 4
    t.datetime "pic_updated_at"
    t.integer  "pic_image_width",  limit: 4
    t.integer  "pic_image_height", limit: 4
    t.string   "psd_file_name",    limit: 255
    t.string   "psd_content_type", limit: 255
    t.integer  "psd_file_size",    limit: 4
    t.datetime "psd_updated_at"
  end

  create_table "productivity_design_pages", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "category_id",  limit: 4
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "purchase_stores", force: :cascade do |t|
    t.integer  "pay_store_id",        limit: 4
    t.string   "purchase_department", limit: 255
    t.string   "purchase_group",      limit: 255
    t.string   "supplier",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "retail_carts", force: :cascade do |t|
    t.integer  "product_id",   limit: 4
    t.string   "measure",      limit: 255
    t.integer  "user_id",      limit: 4
    t.string   "session_key",  limit: 255
    t.integer  "trade_id",     limit: 4
    t.integer  "active",       limit: 4,   default: 1, null: false
    t.integer  "lock_version", limit: 4,   default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.string   "client",       limit: 255
  end

  add_index "retail_carts", ["session_key"], name: "index_retail_carts_on_session_key", using: :btree
  add_index "retail_carts", ["user_id"], name: "index_retail_carts_on_user_id", using: :btree

  create_table "retail_commissions", force: :cascade do |t|
    t.integer  "shop_id",      limit: 4
    t.decimal  "rate",                   precision: 10, scale: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                                          default: true, null: false
    t.integer  "lock_version", limit: 4,                          default: 0,    null: false
    t.datetime "created_at",                                                     null: false
    t.datetime "updated_at",                                                     null: false
  end

  create_table "retail_games", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.integer  "period",       limit: 4
    t.integer  "times",        limit: 4
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                     default: true
    t.boolean  "published",                  default: false
    t.integer  "lock_version", limit: 4,     default: 0
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
  end

  create_table "retail_guides", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "shop_id",      limit: 4
    t.integer  "percent",      limit: 4
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                   default: true, null: false
    t.integer  "lock_version", limit: 4,   default: 0,    null: false
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
  end

  create_table "retail_mall_promotions", force: :cascade do |t|
    t.string   "code",         limit: 255
    t.integer  "shop_id",      limit: 4
    t.decimal  "rate",                     precision: 10, scale: 4
    t.datetime "started_at"
    t.datetime "ended_at"
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                                            default: true, null: false
    t.integer  "lock_version", limit: 4,                            default: 0,    null: false
    t.datetime "created_at",                                                       null: false
    t.datetime "updated_at",                                                       null: false
  end

  create_table "retail_shops", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.text     "description",  limit: 65535
    t.string   "address",      limit: 255
    t.string   "phone",        limit: 255
    t.integer  "keeper_id",    limit: 4
    t.integer  "creator_id",   limit: 4
    t.integer  "updater_id",   limit: 4
    t.boolean  "active",                     default: true,  null: false
    t.boolean  "published",                  default: false, null: false
    t.integer  "lock_version", limit: 4,     default: 0,     null: false
    t.datetime "created_at",                                 null: false
    t.datetime "updated_at",                                 null: false
    t.integer  "contact_id",   limit: 4
    t.boolean  "cashier",                    default: false
    t.boolean  "u",                          default: false, null: false
    t.integer  "store_id",     limit: 4
  end

  create_table "retail_topics", force: :cascade do |t|
    t.string   "name",               limit: 255
    t.text     "description",        limit: 65535
    t.integer  "channel",            limit: 4
    t.string   "url",                limit: 255
    t.text     "product_ids",        limit: 65535
    t.string   "image",              limit: 255
    t.string   "image_file_name",    limit: 255
    t.integer  "image_file_size",    limit: 4
    t.string   "image_content_type", limit: 255
    t.datetime "image_updated_at"
    t.integer  "image_image_width",  limit: 4
    t.integer  "image_image_height", limit: 4
    t.boolean  "active",                           default: true,  null: false
    t.boolean  "published",                        default: false, null: false
    t.integer  "lock_version",       limit: 4,     default: 0,     null: false
    t.integer  "creator_id",         limit: 4
    t.integer  "updater_id",         limit: 4
    t.datetime "created_at",                                       null: false
    t.datetime "updated_at",                                       null: false
    t.string   "image_iphone",       limit: 255
  end

  create_table "retail_trophies", force: :cascade do |t|
    t.integer  "game_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.string   "result",       limit: 255
    t.integer  "product_id",   limit: 4
    t.integer  "voucher_id",   limit: 4
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
    t.integer  "item_id",      limit: 4
  end

  add_index "retail_trophies", ["game_id", "user_id"], name: "index_retail_trophies_on_game_id_and_user_id", using: :btree
  add_index "retail_trophies", ["user_id", "game_id"], name: "index_retail_trophies_on_user_id_and_game_id", using: :btree

  create_table "retail_users", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "sex",          limit: 255
    t.string   "pic",          limit: 255
    t.datetime "login_at"
    t.integer  "lock_version", limit: 4,   default: 0, null: false
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "search_brand_mappings", force: :cascade do |t|
    t.integer  "original_brand_id", limit: 4
    t.integer  "brand_id",          limit: 4
    t.integer  "lock_version",      limit: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editor_id",         limit: 4
    t.boolean  "active",                      default: true, null: false
  end

  create_table "search_brands", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "chinese",      limit: 255
    t.integer  "mall_id",      limit: 4
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                   default: true, null: false
  end

  create_table "search_categories", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "lock_version", limit: 4,     default: 0
    t.integer  "parent_id",    limit: 4
    t.integer  "mall_id",      limit: 4
    t.text     "description",  limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                     default: true, null: false
  end

  create_table "search_category_mappings", force: :cascade do |t|
    t.integer  "original_category_id", limit: 4
    t.integer  "category_id",          limit: 4
    t.integer  "lock_version",         limit: 4, default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editor_id",            limit: 4
    t.boolean  "active",                         default: true, null: false
  end

  create_table "search_editors", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.integer  "editor_id",     limit: 4
    t.integer  "supervisor_id", limit: 4
    t.datetime "destroyed_at"
    t.boolean  "active",                    default: true, null: false
    t.integer  "lock_version",  limit: 4,   default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_malls", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.integer  "lock_version", limit: 4,   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "crawled_at"
    t.boolean  "switch",                   default: false, null: false
    t.integer  "editor_id",    limit: 4
    t.boolean  "active",                   default: true,  null: false
    t.string   "logo",         limit: 255
    t.string   "code",         limit: 255
  end

  create_table "search_products", force: :cascade do |t|
    t.string   "name",                  limit: 255
    t.string   "skuid",                 limit: 255
    t.string   "pic",                   limit: 255
    t.string   "url",                   limit: 255
    t.integer  "price",                 limit: 4
    t.integer  "original_price",        limit: 4
    t.string   "percent",               limit: 255
    t.string   "spu",                   limit: 255
    t.string   "target",                limit: 255
    t.text     "description",           limit: 65535
    t.text     "discount_history",      limit: 65535
    t.integer  "unsold_count",          limit: 4
    t.integer  "brand_id",              limit: 4
    t.integer  "category1_id",          limit: 4
    t.integer  "category2_id",          limit: 4
    t.integer  "original_brand_id",     limit: 4
    t.integer  "original_category1_id", limit: 4
    t.integer  "original_category2_id", limit: 4
    t.integer  "mall_id",               limit: 4
    t.integer  "lock_version",          limit: 4,     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "editor_id",             limit: 4
    t.boolean  "active",                              default: true,  null: false
    t.boolean  "published",                           default: false, null: false
    t.string   "stock",                 limit: 255
    t.boolean  "sync_locked",                         default: false
    t.integer  "similar",               limit: 4
  end

  create_table "search_products_updatings", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "spu",          limit: 255
    t.string   "stock",        limit: 255
    t.string   "target",       limit: 255
    t.string   "url",          limit: 255
    t.string   "unsold_count", limit: 255
    t.string   "price",        limit: 255
    t.integer  "product_id",   limit: 4
    t.integer  "lock_version", limit: 4,   default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "search_users", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "sex",          limit: 255
    t.date     "birthday"
    t.text     "friend_ids",   limit: 65535
    t.string   "pic",          limit: 255
    t.datetime "login_at"
    t.boolean  "active",                     default: true, null: false
    t.integer  "lock_version", limit: 4,     default: 0,    null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sessions", force: :cascade do |t|
    t.string   "session_id", limit: 255,   null: false
    t.text     "data",       limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], name: "index_sessions_on_session_id", using: :btree
  add_index "sessions", ["updated_at"], name: "index_sessions_on_updated_at", using: :btree

  create_table "share_audios", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "href",         limit: 255
    t.text     "description",  limit: 65535
    t.text     "attachment",   limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "share_audios", ["active"], name: "index_share_audios_on_active", using: :btree
  add_index "share_audios", ["created_at"], name: "index_share_audios_on_created_at", using: :btree
  add_index "share_audios", ["destroyed_at"], name: "index_share_audios_on_destroyed_at", using: :btree
  add_index "share_audios", ["updated_at"], name: "index_share_audios_on_updated_at", using: :btree
  add_index "share_audios", ["user_id"], name: "index_share_audios_on_user_id", using: :btree

  create_table "share_files", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "href",         limit: 255
    t.text     "description",  limit: 65535
    t.text     "attachment",   limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "share_files", ["active"], name: "index_share_files_on_active", using: :btree
  add_index "share_files", ["created_at"], name: "index_share_files_on_created_at", using: :btree
  add_index "share_files", ["destroyed_at"], name: "index_share_files_on_destroyed_at", using: :btree
  add_index "share_files", ["updated_at"], name: "index_share_files_on_updated_at", using: :btree
  add_index "share_files", ["user_id"], name: "index_share_files_on_user_id", using: :btree

  create_table "share_images", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "href",         limit: 255
    t.text     "description",  limit: 65535
    t.text     "attachment",   limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "share_images", ["active"], name: "index_share_images_on_active", using: :btree
  add_index "share_images", ["created_at"], name: "index_share_images_on_created_at", using: :btree
  add_index "share_images", ["destroyed_at"], name: "index_share_images_on_destroyed_at", using: :btree
  add_index "share_images", ["updated_at"], name: "index_share_images_on_updated_at", using: :btree
  add_index "share_images", ["user_id"], name: "index_share_images_on_user_id", using: :btree

  create_table "share_pages", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "href",         limit: 255
    t.text     "description",  limit: 65535
    t.text     "attachment",   limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "share_pages", ["active"], name: "index_share_pages_on_active", using: :btree
  add_index "share_pages", ["created_at"], name: "index_share_pages_on_created_at", using: :btree
  add_index "share_pages", ["destroyed_at"], name: "index_share_pages_on_destroyed_at", using: :btree
  add_index "share_pages", ["updated_at"], name: "index_share_pages_on_updated_at", using: :btree
  add_index "share_pages", ["user_id"], name: "index_share_pages_on_user_id", using: :btree

  create_table "share_videos", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.string   "name",         limit: 255
    t.string   "href",         limit: 255
    t.text     "description",  limit: 65535
    t.text     "attachment",   limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "share_videos", ["active"], name: "index_share_videos_on_active", using: :btree
  add_index "share_videos", ["created_at"], name: "index_share_videos_on_created_at", using: :btree
  add_index "share_videos", ["destroyed_at"], name: "index_share_videos_on_destroyed_at", using: :btree
  add_index "share_videos", ["updated_at"], name: "index_share_videos_on_updated_at", using: :btree
  add_index "share_videos", ["user_id"], name: "index_share_videos_on_user_id", using: :btree

  create_table "simple_captcha_data", force: :cascade do |t|
    t.string   "key",        limit: 40
    t.string   "value",      limit: 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "simple_captcha_data", ["key"], name: "index_simple_captcha_data_on_key", using: :btree

  create_table "social_users", force: :cascade do |t|
    t.string   "name",         limit: 255
    t.string   "sex",          limit: 255
    t.string   "pic",          limit: 255
    t.datetime "birthday"
    t.text     "friend_ids",   limit: 65535
    t.datetime "login_at"
    t.integer  "lock_version", limit: 4,     default: 0, null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talk_inboxes", force: :cascade do |t|
    t.integer  "message_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.boolean  "sent"
    t.boolean  "receive"
    t.boolean  "trash"
    t.boolean  "spam"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "unread"
    t.boolean  "haspic"
    t.boolean  "system"
  end

  add_index "talk_inboxes", ["created_at"], name: "index_talk_inboxes_on_created_at", using: :btree
  add_index "talk_inboxes", ["message_id"], name: "index_talk_inboxes_on_message_id", using: :btree
  add_index "talk_inboxes", ["receive"], name: "index_talk_inboxes_on_receive", using: :btree
  add_index "talk_inboxes", ["sent"], name: "index_talk_inboxes_on_sent", using: :btree
  add_index "talk_inboxes", ["spam"], name: "index_talk_inboxes_on_spam", using: :btree
  add_index "talk_inboxes", ["trash"], name: "index_talk_inboxes_on_trash", using: :btree
  add_index "talk_inboxes", ["unread"], name: "index_talk_inboxes_on_unread", using: :btree
  add_index "talk_inboxes", ["updated_at"], name: "index_talk_inboxes_on_updated_at", using: :btree
  add_index "talk_inboxes", ["user_id", "unread", "updated_at"], name: "by_user_id_and_unread_and_updated_at", using: :btree
  add_index "talk_inboxes", ["user_id"], name: "index_talk_inboxes_on_user_id", using: :btree

  create_table "talk_messages", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.text     "content",    limit: 65535
    t.text     "user_ids",   limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "talk_notifications", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "receiver_id",  limit: 4
    t.text     "content",      limit: 65535
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "unread"
    t.integer  "feed_id",      limit: 4
  end

  add_index "talk_notifications", ["active", "receiver_id", "created_at"], name: "by_active_and_receiver_id_and_created_at", using: :btree
  add_index "talk_notifications", ["active"], name: "index_talk_notifications_on_active", using: :btree
  add_index "talk_notifications", ["created_at"], name: "index_talk_notifications_on_created_at", using: :btree
  add_index "talk_notifications", ["destroyed_at"], name: "index_talk_notifications_on_destroyed_at", using: :btree
  add_index "talk_notifications", ["receiver_id"], name: "index_talk_notifications_on_receiver_id", using: :btree
  add_index "talk_notifications", ["unread"], name: "index_talk_notifications_on_unread", using: :btree
  add_index "talk_notifications", ["updated_at"], name: "index_talk_notifications_on_updated_at", using: :btree
  add_index "talk_notifications", ["user_id"], name: "index_talk_notifications_on_user_id", using: :btree

  create_table "talk_replies", force: :cascade do |t|
    t.integer  "message_id", limit: 4
    t.integer  "user_id",    limit: 4
    t.text     "content",    limit: 65535
    t.text     "attachment", limit: 65535
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic",        limit: 255
  end

  add_index "talk_replies", ["created_at"], name: "index_talk_replies_on_created_at", using: :btree
  add_index "talk_replies", ["message_id"], name: "index_talk_replies_on_message_id", using: :btree
  add_index "talk_replies", ["updated_at"], name: "index_talk_replies_on_updated_at", using: :btree
  add_index "talk_replies", ["user_id"], name: "index_talk_replies_on_user_id", using: :btree

  create_table "talk_requests", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "receiver_id",  limit: 4
    t.integer  "object_id",    limit: 4
    t.text     "content",      limit: 65535
    t.string   "type",         limit: 255
    t.boolean  "accept"
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "talk_requests", ["accept"], name: "index_talk_requests_on_accept", using: :btree
  add_index "talk_requests", ["active", "receiver_id", "created_at"], name: "by_active_and_receiver_id_and_created_at", using: :btree
  add_index "talk_requests", ["active"], name: "index_talk_requests_on_active", using: :btree
  add_index "talk_requests", ["created_at"], name: "index_talk_requests_on_created_at", using: :btree
  add_index "talk_requests", ["destroyed_at"], name: "index_talk_requests_on_destroyed_at", using: :btree
  add_index "talk_requests", ["object_id"], name: "index_talk_requests_on_object_id", using: :btree
  add_index "talk_requests", ["receiver_id"], name: "index_talk_requests_on_receiver_id", using: :btree
  add_index "talk_requests", ["updated_at"], name: "index_talk_requests_on_updated_at", using: :btree
  add_index "talk_requests", ["user_id"], name: "index_talk_requests_on_user_id", using: :btree

  create_table "talk_users", force: :cascade do |t|
    t.string   "name",       limit: 20
    t.string   "sex",        limit: 20
    t.date     "birthday"
    t.text     "friend_ids", limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pic",        limit: 255
    t.string   "status",     limit: 255
  end

  add_index "talk_users", ["birthday"], name: "index_talk_users_on_birthday", using: :btree
  add_index "talk_users", ["created_at"], name: "index_talk_users_on_created_at", using: :btree
  add_index "talk_users", ["login_at"], name: "index_talk_users_on_login_at", using: :btree
  add_index "talk_users", ["updated_at"], name: "index_talk_users_on_updated_at", using: :btree

  create_table "triggers", force: :cascade do |t|
    t.string   "table_name", limit: 20, null: false
    t.integer  "table_id",   limit: 4,  null: false
    t.integer  "user_id",    limit: 4,  null: false
    t.integer  "old_active", limit: 1,  null: false
    t.integer  "new_active", limit: 1,  null: false
    t.integer  "app_id",     limit: 4
    t.datetime "created_at",            null: false
  end

  create_table "user_geofences", force: :cascade do |t|
    t.integer  "user_id",     limit: 4
    t.integer  "geofence_id", limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "user_geofences", ["user_id", "geofence_id"], name: "index_user_geofences_on_user_id_and_geofence_id", unique: true, using: :btree

  create_table "vote_answers", force: :cascade do |t|
    t.integer  "vote_id",      limit: 4
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "option",       limit: 4
    t.boolean  "active",                 default: true
    t.datetime "destroyed_at"
  end

  add_index "vote_answers", ["active"], name: "index_vote_answers_on_active", using: :btree
  add_index "vote_answers", ["created_at"], name: "index_vote_answers_on_created_at", using: :btree
  add_index "vote_answers", ["destroyed_at"], name: "index_vote_answers_on_destroyed_at", using: :btree
  add_index "vote_answers", ["updated_at"], name: "index_vote_answers_on_updated_at", using: :btree
  add_index "vote_answers", ["vote_id"], name: "index_vote_answers_on_vote_id", using: :btree

  create_table "vote_users", force: :cascade do |t|
    t.string   "pic",        limit: 255
    t.string   "name",       limit: 20
    t.string   "sex",        limit: 20
    t.date     "birthday"
    t.text     "friend_ids", limit: 65535
    t.datetime "login_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_users", ["birthday"], name: "index_vote_users_on_birthday", using: :btree
  add_index "vote_users", ["created_at"], name: "index_vote_users_on_created_at", using: :btree
  add_index "vote_users", ["login_at"], name: "index_vote_users_on_login_at", using: :btree
  add_index "vote_users", ["updated_at"], name: "index_vote_users_on_updated_at", using: :btree

  create_table "vote_votes", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "feed_id",      limit: 4
    t.string   "title",        limit: 255
    t.text     "description",  limit: 65535
    t.string   "options",      limit: 255
    t.string   "results",      limit: 255
    t.string   "privacy",      limit: 255
    t.datetime "finished_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "vtype",        limit: 255
    t.boolean  "active",                     default: true
    t.datetime "destroyed_at"
  end

  add_index "vote_votes", ["active"], name: "index_vote_votes_on_active", using: :btree
  add_index "vote_votes", ["created_at"], name: "index_vote_votes_on_created_at", using: :btree
  add_index "vote_votes", ["destroyed_at"], name: "index_vote_votes_on_destroyed_at", using: :btree
  add_index "vote_votes", ["feed_id"], name: "index_vote_votes_on_feed_id", using: :btree
  add_index "vote_votes", ["finished_at"], name: "index_vote_votes_on_finished_at", using: :btree
  add_index "vote_votes", ["updated_at"], name: "index_vote_votes_on_updated_at", using: :btree
  add_index "vote_votes", ["user_id"], name: "index_vote_votes_on_user_id", using: :btree

  create_table "vote_votes_readings", force: :cascade do |t|
    t.integer  "vote_id",    limit: 4
    t.integer  "user_id",    limit: 4
    t.integer  "duration",   limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_votes_readings", ["created_at"], name: "index_vote_votes_readings_on_created_at", using: :btree
  add_index "vote_votes_readings", ["updated_at"], name: "index_vote_votes_readings_on_updated_at", using: :btree
  add_index "vote_votes_readings", ["user_id"], name: "index_vote_votes_readings_on_user_id", using: :btree
  add_index "vote_votes_readings", ["vote_id"], name: "index_vote_votes_readings_on_vote_id", using: :btree

  create_table "vote_votes_updatings", force: :cascade do |t|
    t.integer  "vote_id",    limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "vote_votes_updatings", ["created_at"], name: "index_vote_votes_updatings_on_created_at", using: :btree
  add_index "vote_votes_updatings", ["updated_at"], name: "index_vote_votes_updatings_on_updated_at", using: :btree

  create_table "wechat_invitations", force: :cascade do |t|
    t.integer  "scan_id",    limit: 4
    t.string   "open_id",    limit: 255
    t.string   "inviter_id", limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "wechat_invitations", ["inviter_id"], name: "index_wechat_invitations_on_inviter_id", using: :btree
  add_index "wechat_invitations", ["open_id"], name: "index_wechat_invitations_on_open_id", using: :btree

  create_table "wechat_redpacks", force: :cascade do |t|
    t.string   "open_id",         limit: 255
    t.string   "mch_billno",      limit: 255
    t.integer  "trade_id",        limit: 4
    t.integer  "amount",          limit: 4
    t.datetime "send_at"
    t.boolean  "success"
    t.datetime "received_at"
    t.string   "status",          limit: 255
    t.text     "server_response", limit: 65535
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "wechat_redpacks", ["created_at"], name: "index_wechat_redpacks_on_created_at", using: :btree
  add_index "wechat_redpacks", ["open_id"], name: "index_wechat_redpacks_on_open_id", using: :btree
  add_index "wechat_redpacks", ["trade_id"], name: "index_wechat_redpacks_on_trade_id", using: :btree

  create_table "wechat_scans", force: :cascade do |t|
    t.string   "event_name", limit: 255
    t.string   "open_id",    limit: 255
    t.string   "scene_id",   limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "wechat_scans", ["open_id"], name: "index_wechat_scans_on_open_id", using: :btree

end
