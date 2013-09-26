class StudentsController < ApplicationController
    def create
        @student = Student.new(params[:student])
        if @student.save
            sign_in @student
            flash[:success] = "Welcome to the Social Service Platform"
            redirect_to @student
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
            flash[:success] = "Profile updated"
            sign_in @student
            redirect_to @student
        else
            render 'edit'
        end
    end
    private
    def signed_in_student
        unless signed_in?
            store_location
            redirect_to signin_url, notice: "Please sign in."
        end
    end
    def correct_student
        @student = Student.find(params[:id])
        redirect_to(root_url) unless current_student?(@student)
    end
end