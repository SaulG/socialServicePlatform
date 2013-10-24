class DependencyAttendant < ActiveRecord::Base
    attr_accessible :user_id, :dependency_id
    belongs_to :user
    has_many :programs
end
