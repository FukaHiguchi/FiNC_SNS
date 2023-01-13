class FavoritesController < ApplicationController
  def create 
    @step_log_favorite = Favorite.new(user_id: current_user.id, step_log_id: params[:step_log_id])
    @step_log_favorite.save
  end

  def destroy
    @step_log_favorite = Favorite.find_by(user_id: current_user.id, step_log_id: params[:step_log_id])
    @step_log_favorite.destroy
  end
end
