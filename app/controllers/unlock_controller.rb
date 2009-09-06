require 'rubygems'
require 'cgi'
require 'enumerator'
require 'nokogiri'
require 'open-uri'

class UnlockController < ApplicationController
  def show
    @page = Page.find_by_path(request.path)
    if (@page.nil?) then render(:text => "Page #{request.path} doesn't exist."); return;
    else                 @content = eval(@page.code)
    end
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { convert_to_voice_xml } # show.xml.erb 
    end
  end

  private

  def convert_to_voice_xml
    doc = Nokogiri::HTML(@content)
    if params[:choice_start] then choice_start = params[:choice_start].to_i; url = request.url
    else                          choice_start = 0;                          url = add_parameter(request.url, "choice_start=0")
    end
    choices = doc.xpath("//ul//a[not(@id='back')]").collect { |node| { :url => add_parameter(node.xpath("@href").to_s, "format=xml"), :prompt => node.xpath("text()") } }
    total_choices = choices.size
    choices = (choices[choice_start, 7] || []).enum_with_index.each { |choice, number| choice[:number] = number }
    if choice_start > 0                 then choices << { :number => 8, :url => url.sub(/choice_start=\d*/, "choice_start=#{[0, choice_start-7].max}"), :prompt => "Previous choices" } end
    if choice_start < total_choices - 7 then choices << { :number => 9, :url => url.sub(/choice_start=\d*/, "choice_start=#{choice_start+7}"),          :prompt => "More choices" } end
    back = doc.xpath("//ul//a[@id='back']")[0]; if back then choices << { :number => 'star', :url => add_parameter(back.xpath("@href").to_s, "format=xml"), :prompt => back.xpath("text()") } end
    @content = { :paragraphs => doc.xpath("//p/text()").collect { |node| node.to_s },
                 :choices    => choices }
  end 

  def add_parameter(url, parameter)
    url.include?("?") ? "#{url}&#{parameter}" : "#{url}?#{parameter}"
  end
end
