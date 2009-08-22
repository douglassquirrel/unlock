require 'open-uri'

class UnlockController < ApplicationController
  def show
    page = Page.find_by_path(request.path)
    if (page.nil?) then render(:text => "Page #{request.path} doesn't exist.")
    else                @content = eval(page.code)
    end
  end
end
