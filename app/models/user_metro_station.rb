class UserMetroStation < ActiveRecord::Base
  belongs_to :user
  belongs_to :metro_station

  validates :user, presence: true
  validates :metro_station, presence: true, uniqueness: { scope: :user }
end
