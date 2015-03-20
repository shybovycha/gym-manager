class OwnersController < ApplicationController
  before_action :set_owner, only: [:edit, :update]

  respond_to :html

  def edit
  end

  def update
    @owner.update(owner_params)
    respond_with(@owner)
  end

  private
    def set_owner
      @owner = Owner.find(params[:id])
    end

    def owner_params
      params.require(:owner).permit(:name, :address, :email)
    end
end
