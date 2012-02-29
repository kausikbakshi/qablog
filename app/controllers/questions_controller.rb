class QuestionsController < ApplicationController
  def index
    @questions = Question.all(:conditions=>{:user_id => current_user.id}, :order => "created_at desc")
    @answers = Answer.find_all_by_user_id(current_user.id)
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

  def vote
    @question = Question.find(params[:id])
    vote = @question.vote.to_i + 1
    begin
      if @question.update_attribute('vote', vote)
        redirect_to question_path(:id => @question.id), :notice => "Voting Successful"
      end
    rescue
      redirect_to question_path(:id => @question.id), :notice => "Voting Unsuccessful"
    end
  end
end
