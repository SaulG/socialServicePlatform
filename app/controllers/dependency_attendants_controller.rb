class DependencyAttendantsController < ApplicationController
    def create
        @dependency_attendant = DependencyAttendant.new(params[:dependency_attendant])
        @dependency_attendant.user_id = current_user.id
        if @dependency_attendant.save
            redirect_to current_user
        else
            render 'new'
        end
    end
    
    def new
        @dependency_attendant = DependencyAttendant.new()
        @dependency_attendant.user_id = current_user.id
    end
    
    def show
        @dependency_attendant = DependencyAttendant.find_by_user_id(params[:id])
    end

    def edit
        @dependency_attendant = DependencyAttendant.find(current_dependency_attendant.id)
    end

    def update
        @dependency_attendant = DependencyAttendant.find(params[:id])
        if @dependency_attendant.update_attributes(params[:dependency_attendant])
            flash[:success] = "La informacion de la dependencia ha sido actualizada."
            redirect_to current_user
        else
            render 'edit'
        end
    end

end
