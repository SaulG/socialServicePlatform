# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  email           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string(255)
#

class User < ActiveRecord::Base

    USER_TYPES = { 'student' => 'Student', 'institution_attendant' => 'InstitutionAttendant', 'dependency_attendant' => 'DependencyAttendant'}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

    attr_accessible :email, :name, :last_name, :password, :password_confirmation, :address_attributes, :contact_number_attributes, :role

    has_secure_password

    before_save { |user| user.email = email.downcase }
    before_save :create_remember_token

    validates :name, presence: true, length: { maximum: 50 }
    validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },uniqueness: { case_sensitive: false}
    validates :password, presence: true, length: { minimum: 6 }
    validates :password_confirmation, presence: true

    has_one :address, dependent: :destroy
    has_one :contact_number, dependent: :destroy

    has_one :user_role, :class_name => proc{USER_TYPES[self.role].constantize}

    accepts_nested_attributes_for :address, allow_destroy: true, reject_if: proc { |a| a["description"].blank?}
    accepts_nested_attributes_for :contact_number, allow_destroy: true, reject_if: proc { |a| a["number"].blank?}

    private
    def create_remember_token
        self.remember_token = SecureRandom.urlsafe_base64
    end
end
