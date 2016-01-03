class PlanStudiow < ActiveRecord::Base
  belongs_to :program_ksztalcenia
  has_many :semestry
end
