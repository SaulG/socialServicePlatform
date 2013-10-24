class DependencyAddress < ActiveRecord::Base
    attr_accessible :city, :colony, :dependency_id, :number, :postalcode, :street
    belongs_to :dependency
end
