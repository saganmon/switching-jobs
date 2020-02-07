class OfficesController < ApplicationController

  def index
    @offices = Office.all
  end

  def show
    @office = Office.find(params[:id])
  end

  def import
    Office.import(params[:file])
    redirect_to offices_path, notice: "企業が取り込まれました"
  end

end
