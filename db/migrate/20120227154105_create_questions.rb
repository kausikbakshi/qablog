class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string      :title
      t.text        :description
      t.integer     :vote,        :default => 0
      t.integer     :user_id
      t.integer     :answer_id
      t.timestamps
    end
  end
end
