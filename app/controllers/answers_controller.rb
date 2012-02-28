class AnswersController < ApplicationController

  def create    
    @question = Question.find(params[:id])
    @answer = @question.answers.build(params[:answer])    
    if @answer.save
      redirect_to question_path(:id => @question.id), :notice => "Thank You For Posting Your Answer"
    else
      redirect_to question_path(:id => @question.id), :notice => "Your Answer Is Not Submit Due To Some Error"
    end
  end
  
end
