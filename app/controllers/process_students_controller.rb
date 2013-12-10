class ProcessStudentsController < ApplicationController
    before_filter :check_complete_information
    before_filter :check_student
    def index
    end
end
