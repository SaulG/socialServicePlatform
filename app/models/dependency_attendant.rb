class DependencyAttendant < ActiveRecord::Base
    attr_accessible :user_id, :dependency_id

    belongs_to :user
    belongs_to :dependency

    has_many :programs
end
