module SessionsHelper
    def sign_in(user)
        cookies.permanent[:remember_token] = user.remember_token
        self.current_user = user
        case self.current_user.role
        when 'student'
            Student.find_by_user_id(user.id)
        when 'institution_attendant'
            InstitutionAttendant.find_by_user_id(user.id)
        when 'dependency_attendant'
            DependencyAttendant.find_by_user_id(user.id)
        end
        self.current_configuration = Configuration.find_by_user_id(user.id)
    end

    def signed_in?
        !current_user.nil?
    end

    def current_user=(user)
        @current_user = user
    end

    def current_user
        @current_user ||= User.find_by_remember_token(cookies[:remember_token])
    end
    def current_user?(user)
        user == current_user
    end

    def current_student=(student)
        @current_student = student
    end

    def current_student
        @current_student ||= Student.find_by_user_id(current_user.id)
    end

    def current_student?(student)
        student == current_student
    end
        def current_configuration=(configuration)
        @current_configuration = configuration
    end

    def current_configuration
        @current_configuration ||= Configuration.find_by_user_id(current_user.id)
    end
    def current_configuration?(configuration)
        configuration == current_configuration
    end

    def current_institution_attendant=(institution_attendant)
        @current_institution_attendant = institution_attendant
    end

    def current_institution_attendant
        @current_institution_attendant ||= InstitutionAttendant.find_by_user_id(current_institution_attendant.id)
    end
    def current_institution_attendant?(institution_attendant)
        institution_attendant == current_institution_attendant
    end



    def current_dependency_attendant=(dependency_attendant)
        @current_dependency_attendant = dependency_attendant
    end

    def current_dependency_attendant
        @current_dependency_attendant ||= DependencyAttendant.find_by_user_id(current_dependency_attendant.id)
    end
    def current_dependency_attendant?(dependency_attendant)
        dependency_attendant == current_dependency_attendant
    end



    def sign_out
        case self.current_user.role
        when 'student'
            self.current_student = nil
        when 'institution_attendant'
            self.current_institution_attendant = nil
        when 'dependency_attendant'
            self.current_dependency_attendant = nil
        end
        self.current_user = nil
        self.current_configuration = nil
        cookies.delete(:remember_token)
    end
    def redirect_back_or(default)
        redirect_to(session[:return_to] || default)
        session.delete(:return_to)
    end
    def store_location
        session[:return_to] = request.url
    end
end
