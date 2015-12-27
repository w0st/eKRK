class PlanStudiow < ActiveRecord::Base
  has_one :program_ksztalcenia
  has_many :semestrs
end
