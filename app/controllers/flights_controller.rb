class FlightsController < ApplicationController
  def index
    @flights = Flight.all
  end

  def new
    # render(:text=>params)
    @flight = Flight.new
  end

  def show
    # render(:text=>params[:id])
    @flight = Flight.find(params[:id])
  end

  def edit
    # render(:text=>params[:id])
    @flight = Flight.find(params[:id])
  end

  def update
    # render(:text=>params)
    flight = Flight.find(params[:id])
    flight.update(flight_params)
    redirect_to flight_path(flight)
  end

  def create
    # render(:text=>params)
    flight = Flight.new(flight_params)
    flight.save
    redirect_to flight_path(flight)
  end
  protected
  def flight_params
    params.require(:flight).permit(:hours, :minutes, :seconds, :total)
  end
end
