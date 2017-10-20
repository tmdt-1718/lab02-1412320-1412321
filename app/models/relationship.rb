class Relationship < ApplicationRecord
	belongs_to :user_one, class_name: "User"
	belongs_to :user_two, class_name: "User"
  validates :user_one_id, presence: true
	validates :user_two_id, presence: true
	validates :user_one_id, uniqueness: { scope: :user_two_id }
	scope :between, -> (user_one_id, user_two_id) { where(user_one_id: user_one_id, user_two_id: user_two_id).or(
		where(user_one_id: user_two_id, user_two_id: user_one_id)) }
end
