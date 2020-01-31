class ConditionsController < ApplicationController

  def index
    @condition = Condition.new
    @conditions = Condition.all
  end

  def create
    
  end

end
