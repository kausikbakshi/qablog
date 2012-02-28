class HomeController < ApplicationController
  def index
      @questions = Question.all(:order => "created_at desc")    
  end
end
#@contact_us = Contactus.paginate(:page => params[:page], :per_page => 30, :order => "id desc")