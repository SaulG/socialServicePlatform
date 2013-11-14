class ProcessStudentsController < ApplicationController
    def index
        @number_of_programs = Student.find_by_user_id(current_student.id).programs.count
    end
end
