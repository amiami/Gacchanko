class KitsController < ApplicationController
  CATEGORIES = {
    "base" => "基本", "season" => "季節", "purpose" => "目的",
    "duration" => "日数", "weather" => "天気"
  }.freeze

  def index
    @kits = current_user.kits.includes(:kit_items).order(:category, :id)
    @labels = CATEGORIES
  end

  def new
      @kit = current_user.kits.build
      @categories = CATEGORIES
  end

  def create
    @kit = current_user.kits.build(kit_params.merge(select_type: "multi"))
    items = parse_item_names

    if items.empty?
      @categories = CATEGORIES
      flash.now[:alert] = "持ち物を1つ以上入力してください"
      render :new, status: :unprocessable_entity
      return
    end

    ActiveRecord::Base.transaction do
      @kit.save!
      items.each { |name| @kit.kit_items.create!(item_name: name) }
    end

    redirect_to kits_path, notice: "シーンを作成しました"
  rescue ActiveRecord::RecordInvalid
    @categories = CATEGORIES
    flash.now[:alert] = "シーン作成に失敗しました"
    render :new, status: :unprocessable_entity
  end

  def destroy
    current_user.kits.find(params[:id]).destroy!
    redirect_to kits_path, notice: "シーンを削除しました"
  end

  private

  def kit_params
    params.require(:kit).permit(:name, :category)
  end

  def parse_item_names
    params[:kit][:item_names].to_s.split("\n").map(&:strip).reject(&:blank?).uniq
  end
end
