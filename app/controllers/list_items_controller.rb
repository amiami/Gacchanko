class ListItemsController < ApplicationController
  def update
    item = ListItem.joins(:packing_list)
                  .where(packing_lists: { user_id: current_user.id })
                  .find(params[:id])
    item.update!(is_checked: params[:is_checked])
    head :no_content
  rescue ActiveRecord::RecordNotFound
    head :not_found
  rescue ActiveRecord::RecordInvalid
    head :unprocessable_entity
  end
end
