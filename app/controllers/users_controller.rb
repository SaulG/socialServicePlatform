class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:edit, :update, :show]
    before_filter :correct_user, only: [:edit, :update, :show]
    before_filter :check_filled_information_user
    before_filter :check_information_role

    def create
        @user = User.new(params[:user])
        if @user.save
            case @user.role
            when 'student'
                s = Student.new(user_id:@user.id)
                s.save
            when 'institution_attendant'
                i = InstitutionAttendant.new(user_id:@user.id)
                i.save
            when 'dependency_attendant'
                d = DependencyAttendant.new(user_id:@user.id)
                d.save
            end
            sign_in @user
            flash[:success] = "Bienvenido a la plataforma del Servicio Social."
            redirect_to @user
        else
            @role = @user.role
            render 'new'
        end
    end
    def new
        if (params[:role] == 'student') or (params[:role] == 'institution_attendant') or \
            (params[:role] == 'dependency_attendant')
            @user = User.new()
            @role = params[:role]
        else
            redirect_to root_path
        end
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        if current_user.address.nil?
            @user.build_address
        end
        if current_user.contact_number.nil?
            @user.build_contact_number
        end
    end

    def update
        if @user.update_attributes(params[:user])
            flash[:success] = "La informacion personal ha sido actualizada."
            sign_in @user
            redirect_to @user
        else
            if current_user.address.nil?
                @user.build_address
                @user.build_contact_number
            end
            render 'edit'
        end
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

    def check_filled_information_user
        if current_user.name.blank? and current_user.address.blank?
            redirect_to edit_user_path(current_user), notice: "Por favor, llena tu informacion personal para poder completar el registro."
        end
    end

    def check_information_role
        case current_user.role
        when 'student'
            redirect_to edit_student_path(current_user), notice: "Por favor, actualiza tu informacion de estudiante para completar tu registro."
        end
    end

    def check_status_user
        redirect_to current_user, notice: "Please wait until the administrator approve your account." unless current_user.authorization.nil?
    end
end
