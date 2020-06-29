class Book < ApplicationRecord
	validates :title, presence: true
	validates :body, presence: true, length:{maximum:200}
	# デフォルトでuser_idにはバリデーションがかかっているから、必要ない
	validates :user_id, presence: true

	belongs_to :user
end
