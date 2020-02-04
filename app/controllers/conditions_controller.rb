class ConditionsController < ApplicationController

  def index
    @condition = Condition.new
    @conditions = Condition.all
    @offices = Office.all
  end

  def new
    @condition = Condition.new
    # @offices = Office.all
  end

  def create
    @condition = Condition.create(post_params)
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: "活動を登録しました" }
      format.json
    end
  end

  def show
    @condition = Condition.find(params[:id])
  end

  def edit
    @condition = Condition.find(params[:id])
  end

  def update
    condition = Condition.find(params[:id])
    condition.update(post_params)
    # redirect_to condition_path(condition.id)
    redirect_to conditions_path
  end

  def destroy
    condition = Condition.find(params[:id])
    condition.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:condition).permit(:phase, :date, :memo, :office_id).merge(user_id: current_user.id)
  end

end