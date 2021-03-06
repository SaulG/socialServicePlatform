class ProgramsController < ApplicationController
    before_filter :check_complete_information

    def prueba
        @dependencies = Dependency.all
        @hash = Gmaps4rails.build_markers(@dependencies) do |dependency, marker|
            marker.lat dependency.location.latitude
            marker.lng dependency.location.longitude
            marker.infowindow "Prueba"
        end
    end
    def show
        @program = Program.find_by_dependency_attendant_id(params[:id])
    end
    def index
        @programs = []
        @programs = Program.find_all_by_dependency_attendant_id(current_dependency_attendant.id)
        @turns = Hash.new()
        Turn.all.each do |turn| @turns[turn.id] = turn.name end
    end

    def create
        @program = Program.new(params[:program])
        @program.dependency_attendant_id = current_dependency_attendant.id
        @program.dependency_id = current_dependency_attendant.dependency_id
        @program.save
        @program.reload
        @skills = Skill.find(params[:skills])
        @aptitudes = Aptitude.find(params[:aptitudes])
        @program.skills << @skills
        @program.aptitudes << @aptitudes
        if @program.save
            flash[:success] = "Ha sido guardado la informacion del programa."
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
