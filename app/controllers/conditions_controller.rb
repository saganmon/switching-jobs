class ConditionsController < ApplicationController

  def index
    @condition = Condition.new
    @conditions = Condition.all
    @offices = Office.all
  end

  def new
    @condition = Condition.new
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
    params.require(:condition).permit(:phase, :date, :memo, :office_id).merge(user_id: current_user.id)
  end

end