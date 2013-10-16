class StudentsController < ApplicationController
    def create
        @student = Student.new(params[:student])
        @student.user_id = current_user.id
        if @student.save
            redirect_to current_user
        else
            render 'new'
        end
    end

    def new
        @student = Student.new
    end

    def show
        @student = Student.find_by_user_id(params[:id])
    end

    def edit
        @student = Student.find(params[:id])
        @student.institution_name = Institution.find(@student.institution_id).name
    end

    def update
        @student = Student.find_by_id(params[:id])
        if @student.update_attributes(params[:student])
            flash[:success] = "Student information updated"
            redirect_to current_user
        else
            render 'edit'
        end
    end
end
