class ProfilesController < ApplicationController

  def show
    @profile = Profile.find_by_username(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profile }
    end
  end

  # POST /profiles
  # POST /profiles.json
  def create
    profile = Profile.find_or_create_by_username(params[:username])
    profile.update_profile
    profile.save
    redirect_to profile
  end

end
