class WorkoutsController < ApplicationController
  before_action :set_club
  before_action :set_workout, only: [:show, :edit, :update, :destroy, :leave, :join]
  before_action :check_membership, only: [:new, :create, :leave, :join]

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
    @workout = @club.workouts.create(workout_params)

    if member_signed_in?
      current_member.workouts << @workout
    end

    redirect_to @club
  end

  def update
    @workout.update(workout_params)
    redirect_to @club
  end

  def destroy
    @workout.destroy
    redirect_to @club
  end

  def join
    @workout.members << current_member
    redirect_to request.referer
  end

  def leave
    @workout.members.delete current_member
    redirect_to request.referer
  end

  private
    def set_workout
      @workout = Workout.find(params[:id])
    end

    def set_club
      @club = Club.find(params[:club_id])
    end

    def workout_params
      params.require(:workout).permit(:title)
    end

    def check_membership
      unless member_signed_in? or current_member.is_member_of?(@club)
        raise "You are not a member of this club"
      end
    end
end
