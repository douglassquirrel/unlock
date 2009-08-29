require 'rubygems'
require 'cgi'
require 'nokogiri'
require 'open-uri'

class UnlockController < ApplicationController
  def show
    @page = Page.find_by_path(request.path)
    if (@page.nil?) then render(:text => "Page #{request.path} doesn't exist.")
    else                 @content = eval(@page.code)
    end
    respond_to do |format|
      format.html # unlock.html.erb
      format.xml  { render :xml => "<hello>world</hello>" }
    end
  end
end
