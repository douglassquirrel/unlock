class UnlockController < ApplicationController
  # GET /unlock
  def index
    @name = "<em>squirrel</em>"
    print @name
    respond_to do |format|
      format.html # index.html.erb
    end
  end
end
