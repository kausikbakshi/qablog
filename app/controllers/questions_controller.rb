class QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create    
    @question = current_user.questions.build(params[:question])
    if @question.save
      redirect_to root_url, :notice => "Thank You For Posting Your Question"
    else
      render 'new'
    end    
  end

  def show
    
  end
end
