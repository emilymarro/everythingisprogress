class DaysController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @days = Day.all
    @activities = Activity.all
    # puts current_user.id
  end

  def show
    @day = Day.find(params[:id])
    # @activity = Activity.find(params[:id])
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
    #had to include this to save to individual user
    @day = current_user.days.build(params[:day_params])
    # @day = Day.new(day_params)
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
    params.require(:day).permit(:date, :journal, :user_id, :created_at, :updated_at)
  end

  def activity_params
    params.require(:activity).permit(:actname, :points, :day_id, :user_id, :created_at, :updated_at)
  end
end

