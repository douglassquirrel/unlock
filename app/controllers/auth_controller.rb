class AuthController < ApplicationController
  def index
  end

  def login
    @user = User.find_by_passcode(params[:passcode])
    if (@user.nil?) then 
      flash[:notice] = "Passcode not recognised"
      redirect_to :action => "index", :format => params[:format]
    else
      redirect_to "/home?user=#{@user.first_name}&format=#{params[:format]}"
    end
  end
end

