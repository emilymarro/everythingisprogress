class DaysController < ApplicationController
  before_action :authenticate_user!
  def index
    @days = Day.where(user_id: current_user.id).order("date ASC").all
    # @activities = Activity.where(user)
    puts current_user.id
  end




  def show
    @day = Day.find(params[:id])
    # @activity = Activity.where(user_id: current_user.id)
    #   if @activity.day_id == @day.id
    #       @name = @activity.actname
    #       @points = @activity.points
    #   end
    @activities = @day.activities
    total = 0
    @activities.each do |activity|
      total += activity.points.to_i
    end
    @total = total
  end


  def new
    @day = Day.new
    @user_id = current_user.id
  end

  def create
    puts current_user.id
    @user_id = current_user.id
    @day = Day.new(day_params)
      if @day.save
        redirect_to days_path
      else
        puts "not saved!"
        redirect_to "/"
      end

  end

  def edit
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])
    if @day.update_attributes(day_params)
      redirect_to days_path
    else
      render :edit
    end
  end

  def destroy
    @day = Day.find(params[:id])
    @day.destroy
    redirect_to days_path
  end

private
  def day_params
    params.require(:day).permit(:date, :journal, :user_id)
  end

  def activity_params
    params.require(:activity).permit(:actname, :points, :day_id, :user_id, :created_at, :updated_at)
  end
end

