class OfficesController < ApplicationController
  before_action :login_check, only: [:index, :show, :import]

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
