class SettingsController < ApplicationController

  def index
    @settings = Setting.all
  end

  def new
    @setting = Setting.new
  end

  def create
    @setting = Setting.new(setting_params)
    if @setting.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def destroy
    setting = Setting.find(params[:id])
    setting.destroy
    redirect_to action: :index
  end

  private

  def setting_params
    params.require(:setting).permit(:query, :run_at_hour, :run_at_minute, :limit)
  end
end
