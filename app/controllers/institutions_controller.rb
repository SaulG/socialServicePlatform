class InstitutionsController < ApplicationController
  def getInstitutionsNames
      @institutions = Institution.all
      respond_to do |format|
          format.html
          format.json {render json: @institutions}
      end
  end
end
