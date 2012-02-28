class HomeController < ApplicationController
  def index
    if current_user
      @questions = Question.all(:order => "created_at desc")
    else
      @questions = Question.all(:order => "created_at desc")
    end
  end
end
#@contact_us = Contactus.paginate(:page => params[:page], :per_page => 30, :order => "id desc")