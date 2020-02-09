class ConditionsController < ApplicationController
  # before_action :set_condition, only: [:update, :destroy]

  def welcome
  end

  def create
    @condition = Condition.create(post_params)
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: "活動を登録しました" }
      format.json
    end
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    condition = Condition.find(params[:id])
    condition.update(post_params)
    redirect_to user_path(current_user)
  end

  def destroy
    condition = Condition.find(params[:id])
    condition.destroy
    redirect_to user_path(current_user)
  end

  private
  def post_params
    params.require(:condition).permit(:phase, :result, :date, :memo, :office_id).merge(user_id: current_user.id)
  end

end