class HomeController < ApplicationController
  CATEGORY_ORDER = %w[base season purpose duration weather].freeze
  CATEGORY_LABELS = {
    "base" => "基本", "season" => "季節", "purpose" => "目的",
    "duration" => "日数", "weather" => "天気"
  }.freeze

  def index
    @kits = Kit.includes(:kit_items).to_a
    @grouped = @kits.group_by(&:category)
                    .sort_by { |c, _| CATEGORY_ORDER.index(c) || 99 }
    @labels = CATEGORY_LABELS

    @kits_json = @kits.map { |k|
      { id: k.id, name: k.name, items: k.kit_items.map(&:item_name) }
    }.to_json
  end
end
