class Configuration < ActiveRecord::Base
    attr_accessible :can_send_email, :frequency_id, :notification_in_real_time, :user_id
    belongs_to :user
    belongs_to :frequency
    after_initialize :init
    private
    def init
        if self.new_record?
            self.frequency_id = 1
            self.notification_in_real_time = true
            self.can_send_email = true
        end
    end
end
