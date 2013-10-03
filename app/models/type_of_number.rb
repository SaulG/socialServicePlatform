class TypeOfNumber < ActiveRecord::Base
    attr_accessible :type_of_number
    validates :type_of_number, uniqueness: {case_sensitive: true}
end
