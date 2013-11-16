class UsersController < ApplicationController
    before_filter :signed_in_user, only: [:edit, :update, :show]
    before_filter :correct_user, only: [:edit, :update, :show]

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
            flash[:success] = "Bienvenido a la plataforma del Servicio Social. Por favor complete la informacion faltante."
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
end
