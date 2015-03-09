class UserBikeStation < ActiveRecord::Base
  belongs_to :user

  validates :user, presence: true
  validates :location, presence: true, uniqueness: { scope: :user }
end
