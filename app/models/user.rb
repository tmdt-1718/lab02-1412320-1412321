class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates :name, presence: true
  has_many :active_relationships, class_name:  "Relationship",
                                  foreign_key: "user_one_id",
                                  dependent:   :destroy

  has_many :passive_relationships, class_name:  "Relationship",
                                  foreign_key: "user_two_id",
                                  dependent:   :destroy

  has_many :friendship, through: :active_relationships, source: :user_two
  has_many :friendship_back, through: :passive_relationships, source: :user_one

  has_many :messages, dependent: :destroy

  # Add friend with a user.
  def add_friend(other_user)
    friendship << other_user
  end

  # Unfriend with a user.
  def unfriend(other_user)
    friendship.delete(other_user)
    friendship_back.delete(other_user)
  end

  def is_pending?(status)
    status == 1
  end

  # Returns true if the current user is a friend of the other user.
  def is_friend?(relationship)
    relationship.status == 2 || relationship.status == 3
  end

  def is_block?(relationship)
    (relationship.status == 3) && ((relationship.block_id == self.id) || (relationship.block_id == -1))
  end

  def self.find_friend(user, relationship)
		if relationship
			if user.id == relationship.user_one_id
				relationship.user_two_id
			else
				relationship.user_one_id
			end
		end
	end

  def self.friend_num(relationships)
		friend_num = 0
		relationships.each do |relationship|
			if relationship.status > 1
				friend_num += 1
			end
		end
    friend_num
  end
end
