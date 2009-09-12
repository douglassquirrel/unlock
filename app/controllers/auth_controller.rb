class AuthController < ApplicationController
  def index
  end

  def login
    if 1==1 then 
      flash[:notice] = "Passcode not recognised"
      redirect_to :action => "index"
    else
      redirect_to "/home"
    end
  end
end

