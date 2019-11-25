class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :content
      t.string :photo
      t.references :user, foreign_key: true
      t.references :dish, foreign_key: true

      t.timestamps
    end
  end
end
