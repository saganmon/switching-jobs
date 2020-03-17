class UsersController < ApplicationController
  before_action :login_check, only: [:index, :show]

  def index
    @activity_logs = ActivityLog.all.order(updated_at: :desc).limit(5)
  end

  def show
    @condition = Condition.new
    set_conditions
  end

  private

  def set_conditions
    if current_user.admin?
      @conditions = Condition.all.includes(:user)
    else
      @conditions = current_user.conditions
    end
  end

end
