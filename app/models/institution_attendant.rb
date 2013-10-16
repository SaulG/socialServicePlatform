class InstitutionAttendant < ActiveRecord::Base
    attr_accessible :institution_id, :user_id
    belongs_to :user
end
