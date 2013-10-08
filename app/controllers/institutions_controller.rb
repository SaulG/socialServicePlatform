class InstitutionsController < ApplicationController
    def getInstitutionsNames
        @institutions = Institution.find(:all, :select => 'name')
        respond_to do | format|
            format.html
            format.json {
                render :json =>
                @institutions.collect{|i|{:value => i.name } } }
        end
    end
end
