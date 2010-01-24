#!/usr/bin/env ruby 

require 'rubygems'                                                                                      
require 'webrat'
require 'webrat/adapters/mechanize'
require 'net/ssh'

Webrat.configure do |config|
  config.mode = :mechanize
end

World(Webrat::Methods)
World(Webrat::Matchers)


#class ResponseHelper
#  def response
#    webrat_session.response
#  end
#end

#World do
#  ResponseHelper.new
#  Webrat::Session.new(Webrat::MechanizeAdapter.new)
#end


