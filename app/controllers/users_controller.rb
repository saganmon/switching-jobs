class UsersController < ApplicationController

  def index
  end

  def show
    if user_signed_in?
      @nickname = current_user.nickname
      @condition = Condition.new
      @conditions = current_user.conditions.order("phase DESC")
    else redirect_to conditions_path
    end
  end

end
