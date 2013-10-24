class Program < ActiveRecord::Base
    attr_accessible :dependency_attendant_id, :dependency_id, :description, :name, :quantity_of_students, :turn_id
    belongs_to :dependency_attendant
    belongs_to :dependency
    belongs_to :turn
    has_many :skills
    has_many :aptitudes
end
