class WorkoutsController < ApplicationController
  before_action :set_workout, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @workouts = Workout.all
    respond_with(@workouts)
  end

  def show
    respond_with(@workout)
  end

  def new
    @workout = Workout.new
    respond_with(@workout)
  end

  def edit
  end

  def create
    @workout = Workout.new(workout_params)
    @workout.save
    respond_with(@workout)
  end

  def update
    @workout.update(workout_params)
    respond_with(@workout)
  end

  def destroy
    @workout.destroy
    respond_with(@workout)
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end

    def workout_params
      params.require(:workout).permit(:title)
    end
end
