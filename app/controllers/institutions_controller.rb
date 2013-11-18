class InstitutionsController < ApplicationController
    def index
        if params[:name]
            @institutions = Institution.find(:all, conditions: ['name LIKE ?',"#{params[:name]}"])
        else
            @institutions = Institution.all
        end
        respond_to do |format|
            format.json { render :json => @institutions.to_json }
        end
    end
end
