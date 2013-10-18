class Dependency < ActiveRecord::Base
    attr_accessible :name, :type_of_administration_id, :location_attributes
    belongs_to :type_of_administration
    has_one :location, dependent: :destroy
    accepts_nested_attributes_for :location, allow_destroy: true, reject_if: proc{ |a| a["latitude".blank? or a["longitude"].blank?]}
end
