class AddColumnToVotes < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :username, :string
    create_table :vote_reviews do |t|
      t.integer :vote
      t.references :user, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
