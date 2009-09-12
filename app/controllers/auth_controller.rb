class AuthController < ApplicationController
  filter_parameter_logging :passcode

  def index
  end

  def login
    @user = User.find_by_passcode(params[:passcode])
    if (@user.nil?) then 
      log "Failed login"
      flash[:notice] = "Passcode not recognised"
      redirect_to :action => "index", :format => params[:format]
    else
      log "Successful login by user #{@user.first_name} #{@user.last_name}"   
      redirect_to "/home?user=#{@user.first_name}&format=#{params[:format]}"
    end
  end

  private
  def log(text)
    logger.info "BLINDPAGES: #{Time.new.to_s} #{text}"
  end
end

