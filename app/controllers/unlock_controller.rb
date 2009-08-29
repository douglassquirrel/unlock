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
      format.xml  { render :xml => "<vxml version='2.0' xmlns='http://www.w3.org/2001/vxml'><form><block><break time='1000'/><prompt>Hello world!</prompt></block></form></vxml>" }
    end
  end
end
