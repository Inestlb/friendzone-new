class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many_attached :photos

  has_many :messages

  has_many :matches_as_first_user, class_name: 'Match', foreign_key: 'first_user_id'
  has_many :matches_as_second_user, class_name: 'Match', foreign_key: 'second_user_id'

  has_many :likes_as_liker, class_name: 'Like', foreign_key: 'liker_id'
  has_many :likes_as_liked, class_name: 'Like', foreign_key: 'liked_id'

  has_many :user_events
  has_many :events, through: :user_events

  # validates :age, presence: true, comparison: { greater_than_or_equal_to: 18 }
  # validates :friends_age, presence: true, comparison: { greater_than_or_equal_to: 18 }
  # validates :name, presence: true
  # validates :language, presence: true
  # validates :location, presence: true
  # validates :genre, presence: true
  # validates :situation, presence: true
  # validates :avatar, presence: true
  # validates :photos, presence: true
  # validates :mood, presence: true
  # validates :vacation, presence: true
  # validates :life_choice, presence: true


  def all_matches
    matches_as_first_user + matches_as_second_user
  end


end
