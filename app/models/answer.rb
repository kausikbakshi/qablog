class Answer < ActiveRecord::Base
  belongs_to :question
  belongs_to :user
  attr_accessible :description, :vote, :question_id, :username, :user_id
end
