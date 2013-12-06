class StudentsProgramsController < ApplicationController
#    before_filter :check_student
    def create
#        @student = Student.find_by_user_id(current_user.id)
        puts params.inspect
        p params[:plazas_id]
        respond_to do |format|
            format.js   { render :nothing => true }
            format.html   { render :nothing => true }
        end
#        @student.programs << Program.find(params[:0])
#         if @student.save
#             flash.now[:success] = "Tus plazas han sido guardadas correctamente."
#         else
#             flash.now[:notice] = "Hay un problema en el servidor intenta mas tarde."
#         end
    end
end
