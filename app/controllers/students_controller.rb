class StudentsController < ApplicationController
    def create
        @student = Student.new(params[:student])
        if @student.save
            flash[:success] = "Welcome to the Social Service Platform"
        else
            render 'new'
        end
    end

    def new
        @student = Student.new
    end

    def show
        @student = Student.find(params[:id])
    end

    def edit
    end

    def update
        if @student.update_attributes(params[:student])
            flash[:success] = "Student information updated"
        else
            render 'edit'
        end
    end

    def field_institutions
    end
end
