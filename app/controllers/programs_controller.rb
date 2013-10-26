class ProgramsController < ApplicationController

    def show
        @programs = Program.find_by_dependency_attendant_id(params[:id])
    end

    def create
        @program = Program.new(params[:program])
        @program.dependency_attendant_id = current_dependency_attendant.id
        if @program.save
            redirect_to programs_path
        else
            render 'new'
        end
    end

    def new
        @program = Program.new()
    end

    def edit
        @program = Program.find(params[:id])
    end

    def update
        @program = Program.find(params[:id])
        if @program.update_attributes(params[:program])
            flash[:success] = "La informacion del programa #{@program.name} ha sido actualizada."
        else
            render 'edit'
        end
    end

    def delete
        @program = Program.find(params[:id])
        @program.destroy
    end
end
