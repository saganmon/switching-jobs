class UsersController < ApplicationController
  before_action :login_check, only: [:index, :show]

  def index
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
