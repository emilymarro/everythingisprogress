class ActivitiesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @activities = Activity.all
    total = 0
    @activities.each do |activity|
      total += activity.points.to_i
    end
    @total = total
  end

  def show
    @activity = Activity.find(params[:id])
  end

  def new
    @activity = Activity.new
    @user_id = current_user.id
  end

  def create
    @user_id = current_user.id
    # @day_id = current_day.id
    #had to include this to save to individual user
    @activity = current_user.activities.build(params[:activity_params])
      if @activity.save
        redirect_to days_path
      else
        redirect_to "/"
      end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      redirect_to activities_path
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to activities_path
  end

private
  def activity_params
    params.require(:activity).permit(:actname, :points, :day_id, :user_id)
  end



end

