# -*- coding: utf-8 -*-
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
    begin      
      profile.update_profile      
    rescue => e
      flash[:notice] = "aga cinayet var: #{e.message}"
      redirect_to "/"
    else
      profile.save
      redirect_to profile
    end
  end

end
