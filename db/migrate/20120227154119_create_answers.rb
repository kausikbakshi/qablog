class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text        :description
      t.integer     :vote,        :default => 0
      t.integer     :question_id
      t.string      :username
      t.integer     :user_id
      t.timestamps
    end
  end
end
