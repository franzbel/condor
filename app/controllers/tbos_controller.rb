class TbosController < ApplicationController
  def index
    @tbos = Tbo.all
  end

  def new
    @tbo = Tbo.new
  end

  def show
    # render(:text=>params[:id])
    @tbo = Tbo.find(params[:id])
  end

  def edit
    # render(:text=>params)
    @tbo = Tbo.find(params[:id])
  end

  def create
    # render(:text=>params[:tbo])
    tbo = Tbo.new(tbo_params)
    tbo.save
    # render(:text=>"ok")
    redirect_to tbo_path(tbo)
  end

  def update
    # render(:text=>params[:id])
    tbo = Tbo.find(params[:id])
    tbo.update(tbo_params)
    redirect_to tbo_path(tbo)
  end

  def destroy
    # render(:text=>params)
    tbo = Tbo.find(params[:id])
    tbo.destroy
    redirect_to tbos_path
  end

  private
  def tbo_params
    params.require(:tbo).permit(:name, :part_number, :tbo)
  end
end
