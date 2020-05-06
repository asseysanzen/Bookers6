class Book < ApplicationRecord
	belongs_to :user
	has_many :book_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	#バリデーションは該当するモデルに設定する。エラーにする条件を設定できる。
	#presence trueは空欄の場合を意味する。
	has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy
  	has_many :followings, through: :following_relationships
  	has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy
  	has_many :followers, through: :follower_relationships

	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
	def favorited_by?(user)
       favorites.where(user_id: user.id).exists?
    end
end
