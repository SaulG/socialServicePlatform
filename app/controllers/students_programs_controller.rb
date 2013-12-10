class StudentsProgramsController < ApplicationController
    before_filter :check_student
    def create
        @student = Student.find_by_user_id(current_user.id)
        @student.programs = Program.find(params[:plazas_id])
        p params[:plazas_id]
        if @student.save
            flash.now[:success] = "Tus plazas han sido guardadas correctamente."
        else
             flash.now[:notice] = "Hay un problema en el servidor intenta mas tarde."
        end
        respond_to do |format|
            format.js   { render :nothing => true }
            format.html   { render :nothing => true }
        end
    end
end
