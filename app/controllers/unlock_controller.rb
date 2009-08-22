class UnlockController < ApplicationController
  # GET /unlock
  def index
  end

  def show
   render(:text => request.path)
  end
end
