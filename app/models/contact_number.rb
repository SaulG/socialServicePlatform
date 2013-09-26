class ContactNumber < ActiveRecord::Base
  attr_accessible :number, :type_of_number_id, :user_id
end
