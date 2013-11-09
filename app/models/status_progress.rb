class StatusProgress < ActiveRecord::Base
  attr_accessible :name

    def self.all_order_asc_by_id
        all :order => "id ASC"
    end
end
