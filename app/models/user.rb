class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reviews, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :liked_dishes, through: :votes
  has_many :vote_reviews, dependent: :destroy

  has_many :favorites, dependent: :destroy
  
  def new_user(input_number, input_dish)
    users = self.sample(input_number)
    users.each do |user|
      vote = Vote.new(vote: 1)
      vote.user = user
      vote.dish = dish
      vote.save!
    end
  end
end
