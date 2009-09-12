class AuthController < ApplicationController
  filter_parameter_logging :passcode

  def index
  end

  def login
    @user = User.find_by_passcode(params[:passcode])
    if (@user.nil?) then 
      log "Failed login"
      flash[:notice] = "Passcode not recognised"
      redirect_to :action => "index", :format => params[:format], :connid => params[:connid]
    else
      log "Successful login by user #{@user.first_name} #{@user.last_name}"   
      redirect_to "/home?user=#{@user.first_name}&format=#{params[:format]}"
    end
  end

  def logout
    log "Logout"
    render :nothing => true
  end

  private
  def log(text)
    logger.info "BLINDPAGES: #{Time.new.to_s} #{params[:connid]} #{text}"
  end
end

