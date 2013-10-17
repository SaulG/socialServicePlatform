class InstitutionAttendantsController < ApplicationController
    def create
        @institution_attendant = InstitutionAttendant.new(params[:institution_attendant])
        @institution_attendant.user_id = current_user.id
        if @institution_attendant.save
            redirect_to current_user
        else
            render 'new'
        end
    end
    
    def new
        @institution_attendant = InstitutionAttendant.new()
        @institution_attendant.user_id = current_user.id
    end
    
    def show
        @institution_attendant = InstitutionAttendant.find_by_user_id(params[:id])
    end

    def edit
        @institution_attendant = InstitutionAttendant.find(current_student.id)
    end

    def update
        @institution_attendant = InstitutionAttendant.find(params[:id])
        if @institution_attendant.update_attributes(params[:institution_attendant])
            flash[:success] = "La informacion de la institucion ha sido actualizada."
            redirect_to current_user
        else
            render 'edit'
        end
    end
end
