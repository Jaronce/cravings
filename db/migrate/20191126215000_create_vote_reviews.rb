class CreateVoteReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :vote_reviews do |t|
      t.integer :vote
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
