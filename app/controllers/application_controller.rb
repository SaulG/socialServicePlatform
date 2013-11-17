class ApplicationController < ActionController::Base
    protect_from_forgery
    include SessionsHelper
    helper_method :signed_in_user
    helper_method :correct_user
    helper_method :check_complete_information

    #Force signout to prevent CSRF attacks
    def handle_unverified_request
        sign_out
        super
    end
    private
    def signed_in_user
        unless signed_in?
            store_location
            redirect_to signin_url, notice: "Inicie sesion, por favor."
        end
    end
    def correct_user
        @user = User.find(params[:id])
        redirect_to(current_user) unless current_user?(@user)
    end

    def check_complete_information
        if current_user.name.nil? or current_user.last_name.nil? or current_user.address.nil?
            redirect_to edit_user_path(current_user), notice: "Por favor, llena tu informacion personal para poder completar el registro."
        else
            check_information_role
        end
    end

    def check_information_role
        case current_user.role
        when 'student'
            if Student.find_by_user_id(current_user.id).institution_id.nil?
                redirect_to edit_student_path(current_user), notice: "Por favor, actualiza tu informacion de estudiante para completar tu registro."
            end
        when 'dependency_attendant'
            if DependencyAttendant.find_by_user_id(current_user.id).dependency_id.nil?
                redirect_to edit_dependency_attendant_path(current_user), notice: "Por favor, actualiza tu informacion de dependencia para completar tu registro."
            end
        end
    end
end
