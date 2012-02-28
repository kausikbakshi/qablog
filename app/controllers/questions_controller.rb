class QuestionsController < ApplicationController
  def index
    @questions = Question.all(:conditions=>{:user_id => current_user.id}, :order => "created_at desc")
  end
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
    @question = Question.find(params[:id])
    @answers = @question.answers
  end
end
