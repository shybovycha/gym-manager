class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy, :join, :leave]
  before_action :authenticate, except: [:index, :show]
  before_action :check_membership, only: [:leave, :join]

  before_action :check_ownership, only: [:edit, :update, :destroy]
  before_action :ensure_there_is_no_club, only: [:new, :create]

  respond_to :html

  def index
    @clubs = Club.all
    respond_with(@clubs)
  end

  def show
    respond_with(@club)
  end

  def new
    @club = Club.new
    respond_with(@club)
  end

  def edit
  end

  def create
    @club = Club.create(club_params)
    current_owner.club = @club
    respond_with(@club)
  end

  def update
    @club.update(club_params)
    respond_with(@club)
  end

  def destroy
    @club.destroy
    respond_with(@club)
  end

  def join
    @club.members << current_member
    redirect_to request.referer
  end

  def leave
    @club.members.delete current_member
    redirect_to request.referer
  end

  private
    def set_club
      @club = Club.find(params[:id])
    end

    def club_params
      params.require(:club).permit(:name, :address)
    end

    def check_ownership
      if owner_signed_in? and current_owner.is_owner_of?(@club)
        yield
      else
        raise "You are not owing this club"
      end
    end

    def ensure_there_is_no_club
      unless owner_signed_in? or current_owner.club.blank?
        raise "You are not allowed to create any new clubs"
      end
    end

    def authenticate
      unless member_signed_in? or owner_signed_in?
        raise "You are not signed in"
      end
    end

    def check_membership
      unless member_signed_in? or current_member.is_member_of?(@club)
        raise "You are not a member of this club"
      end
    end
end
