class AnswersController < ApplicationController

  def create    
    @question = Question.find(params[:id])
    @answer = @question.answers.build(params[:answer])
    @answer.user_id = current_user.id
    if @answer.save
      redirect_to question_path(:id => @question.id), :notice => "Thank You For Posting Your Answer"
    else
      redirect_to question_path(:id => @question.id), :notice => "Your Answer Is Not Submit Due To Some Error"
    end
  end

  def vote
    @answer = Answer.find(params[:id])
    @question = @answer.question
    vote = @answer.vote.to_i + 1
    begin
      if @answer.update_attribute('vote', vote)
        redirect_to question_path(:id => @question.id), :notice => "Voting Successful"
      end
    rescue
      redirect_to question_path(:id => @question.id), :notice => "Voting Unsuccessful"
    end
  end
  
end
