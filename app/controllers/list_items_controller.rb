class ListItemsController < ApplicationController
  def update
    item = ListItem.find(params[:id])
    item.update!(is_checked: params[:is_checked])
    head :no_content
  rescue ActiveRecord::RecordInvalid
    head :unprocessable_entity
  end
end
