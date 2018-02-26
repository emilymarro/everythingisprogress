class ActivitiesController < ApplicationController
  before_action :authenticate_user!

  def index
    @activities = Activity.where(user_id: current_user.id)
    puts current_user.id
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
    puts current_user.id
    @user_id = current_user.id
    # @day_id = current_user.date.id
    @activity = Activity.new(activity_params)
      if @activity.save
        redirect_to days_path
      else
        puts "activity not saved!"
        redirect_to "/"
      end
  end

  def edit
    @activity = Activity.find(params[:id])
  end

  def update
    @activity = Activity.find(params[:id])
    if @activity.update_attributes(activity_params)
      redirect_to days_path
    else
      render :edit
    end
  end

  def destroy
    @activity = Activity.find(params[:id])
    @activity.destroy
    redirect_to days_path
  end

private
  def activity_params
    params.require(:activity).permit(:actname, :points, :day_id, :user_id, :created_at, :updated_at)
  end



end

