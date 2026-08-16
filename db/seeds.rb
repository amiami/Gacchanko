data = {
  # category: purpose
  "位置ゲー遠征" => {
    category: "purpose",
    items: [ "モバイルバッテリー", "充電ケーブル", "帽子", "歩きやすい靴",
            "スマホホルダー", "イヤホン", "折りたたみ傘" ]
  },
  "日帰り" => {
    category: "duration",
    items: [ "ハンカチ", "常備薬" ]
  },

  # category: season
  "夏" => {
    category: "season",
    items: [ "日焼け止め", "帽子", "塩分タブレット", "汗拭きシート", "日傘",
            "虫除けスプレー", "折りたたみ傘", "サングラス" ]
  },
  "冬" => {
    category: "season",
    items: [ "手袋", "ネックウォーマー", "カイロ", "リップクリーム", "帽子" ]
  },

  # category: base（常に持つもの）
  "基本" => {
    category: "base",
    items: [ "財布", "鍵", "スマホ", "イヤホン" ]
  }
}

data.each do |name, attrs|
  kit = Kit.find_or_create_by!(name: name) do |k|
    k.category = attrs[:category]
    k.select_type = "multi"
  end
  attrs[:items].each do |item|
    kit.kit_items.find_or_create_by!(item_name: item)
  end
end
