class Course < ActiveRecord::Base

  validates :title, presence: true, uniqueness: true
  validates :day_night

end
