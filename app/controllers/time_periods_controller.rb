class TimePeriodsController < ApplicationController
  def index
    render json: current_user.time_periods
  end

  def create
    period = TimePeriod.create year: params[:year],
                               month: params[:month],
                               user: current_user
    render json: period
  end

  def show
    period = current_user.time_periods.find params[:id]
    render json: period
  end

  def update
    period = current_user.time_periods.find params[:id]
    period.update year: params[:year],
                  month: params[:month]
    render json: period
  end

  def destroy
    period = current_user.time_periods.find params[:id]
    period.destroy
  end
end
