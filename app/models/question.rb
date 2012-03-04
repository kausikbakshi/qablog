class Question < ActiveRecord::Base
  belongs_to :user
  has_many :answers

  attr_accessible :title, :description, :vote, :user_id, :answer_id
  validates :title, :presence => true
  validates :description, :presence => true
end
