class Answer < ActiveRecord::Base
  belongs_to :question

  attr_accessible :description, :vote, :question_id, :username
end
