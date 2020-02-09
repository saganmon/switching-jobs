class UsersController < ApplicationController

  def show
    if user_signed_in?
      @condition = Condition.new
      set_conditions
    else redirect_to conditions_path
    end
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
