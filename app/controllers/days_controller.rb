class DaysController < ApplicationController

  def index
    @days = Day.all
    @activities = Activity.all
  end

  def show
    @day = Day.find(params[:id])
    @activity = Activity.find(params[:id])
      if @activity.day_id == @day.id
          @name = @activity.actname
          @points = @activity.points
      end
    @activities = @day.activities
    total = 0
    @activities.each do |activity|
      total += activity.points.to_i
    end
    @total = total
  end

# Client.find_by first_name:


  def new
    @day = Day.new
  end

  def create
    @day = Day.new(day_params)
      if @day.save
        redirect_to days_path
      else
        redirect_to "/"
      end
  end

  def edit
    @day = Day.find(params[:id])
  end

  def update
    @day = Day.find(params[:id])
    if @day.update_attributes(days_params)
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
    params.require(:day).permit(:date, :journal)
  end

end

