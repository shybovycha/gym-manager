class MembersController < ApplicationController
  before_action :set_member_and_club, only: [:show, :edit, :update, :destroy, :kick]
  before_action :check_membership, only: [:kick]

  respond_to :html

  def index
    @members = Member.all
    respond_with(@members)
  end

  def show
    respond_with(@member)
  end

  def new
    @member = Member.new
    respond_with(@member)
  end

  def edit
  end

  def create
    @member = Member.new(member_params)
    @member.save
    respond_with(@member)
  end

  def update
    @member.update(member_params)
    respond_with(@member)
  end

  def destroy
    @member.destroy
    respond_with(@member)
  end

  def kick
    @club.members.delete @member
    redirect_to request.referer
  end

  private
    def set_member_and_club
      @member = Member.find(params[:id])
      @club = Club.find(params[:club_id])
    end

    def check_membership
      unless @club.members.include? @member
        raise "#{@member.name} is not a member of #{@club.name}"
      end
    end

    def member_params
      params.require(:member).permit(:first_name, :last_name, :birthday, :email)
    end
end
