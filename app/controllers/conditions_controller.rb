class ConditionsController < ApplicationController
  before_action :login_check, only: [:create, :edit, :update, :destroy]

  def create
    @condition = Condition.create(post_params)
    @activity_log = ActivityLog.create(time: @condition.created_at.to_s, log: @condition.user.nickname + "さんが活動を登録しました")
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
    @activity_log = ActivityLog.create(time: condition.updated_at.to_s, log: condition.user.nickname + "さんが活動を更新しました")
    redirect_to user_path(current_user)
  end

  def destroy
    condition = Condition.find(params[:id])
    condition.destroy
    # redirect_to user_path(current_user) # Ajax化のため削除
    head :no_content
  end

  private
  def post_params
    params.require(:condition).permit(:phase, :result, :date, :memo, :office_id).merge(user_id: current_user.id)
  end

end