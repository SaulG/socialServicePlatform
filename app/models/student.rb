class Student < User
    attr_accessible :enrollment, :institution_id
    belongs_to :institution
    validates :enrollment, presence: true
end
