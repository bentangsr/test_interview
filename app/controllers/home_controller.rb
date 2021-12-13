class HomeController < ApplicationController
  def index
    if params[:whoami].eql?('1') && params[:time].eql?('now')
      @time = DateTime.now
      @whoami = request.ip
    elsif params[:whoami].eql?('1')
      @whoami = request.ip
    elsif params[:time].eql?('now')
      @time = DateTime.now
    elsif params[:time].present? && !params[:time].eql?('now')
      @time = "use value 1 for see the current time"
    elsif params[:whoami].present? && !params[:whoami].eql?('1')
      @whoami = "use value 1 for see the current IP"
    end
  end
end
