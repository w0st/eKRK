class Semestr < ActiveRecord::Base
  belongs_to :plan_studiow
  has_many :zajecia
end
