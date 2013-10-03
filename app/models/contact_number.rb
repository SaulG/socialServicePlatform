class ContactNumber < ActiveRecord::Base
    attr_accessible :number, :type_of_number_id, :user_id
    belongs_to :type_of_number

    VALID_NUMBER_REGEX = /^\d{8,12}$/
    validates :number, :numericality => {:only_integer => true},
    format: {with: VALID_NUMBER_REGEX}
end
