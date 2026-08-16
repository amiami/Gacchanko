class PackingListsController < ApplicationController
  def index
  @packing_lists = PackingList.includes(:list_items).order(created_at: :desc)
end

  def show
    @packing_list = PackingList.includes(:list_items).find(params[:id])
  end

  def create
    @packing_list = PackingList.new(packing_list_params)
    items = parse_items

    if items.empty?
      redirect_to root_path, alert: "持ち物が選択されていません"
      return
    end

    ActiveRecord::Base.transaction do
      @packing_list.save!
      items.each do |item|
        @packing_list.list_items.create!(
          item_name: item["item_name"],
          source_labels: item["source_labels"],
          is_checked: false
        )
      end
    end

    redirect_to @packing_list, notice: "保存しました"
  rescue ActiveRecord::RecordInvalid
    redirect_to root_path, alert: "保存に失敗しました"
  end

  private

  def packing_list_params
    params.require(:packing_list).permit(:name, :event_date)
  end

  def parse_items
    JSON.parse(params[:packing_list][:items_json].presence || "[]")
  rescue JSON::ParserError
    []
  end
end
