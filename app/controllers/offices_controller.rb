class OfficesController < ApplicationController

  def index
    @offices = Office.all
  end

  def import
    Office.import(params[:file])
    redirect_to root_path, notice: "企業が取り込まれました"
  end

end
