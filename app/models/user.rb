class User < ApplicationRecord
  has_secure_password
  has_many :sessions, dependent: :destroy
  has_many :kits, dependent: :destroy
  has_many :packing_lists, dependent: :destroy

  validates :email_address, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true

  normalizes :email_address, with: ->(e) { e.strip.downcase }

  DEFAULT_KITS = {
    "基本" => { category: "base", items: ["財布", "鍵", "スマホ", "イヤホン"] },
    "夏" => { category: "season", items: ["日焼け止め", "帽子", "塩分タブレット", "汗拭きシート", "日傘", "虫除けスプレー", "折りたたみ傘", "サングラス"] },
    "冬" => { category: "season", items: ["手袋", "ネックウォーマー", "カイロ", "リップクリーム", "帽子"] },
    "位置ゲー遠征" => { category: "purpose", items: ["モバイルバッテリー", "充電ケーブル", "帽子", "歩きやすい靴", "スマホホルダー", "イヤホン", "折りたたみ傘"] },
    "日帰り" => { category: "duration", items: ["ハンカチ", "常備薬"] }
  }.freeze

  def create_default_kits!
    DEFAULT_KITS.each do |name, attrs|
      kit = kits.create!(name: name, category: attrs[:category], select_type: "multi")
      attrs[:items].each { |n| kit.kit_items.create!(item_name: n) }
    end
  end
end
