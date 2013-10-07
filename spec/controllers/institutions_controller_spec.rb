require 'spec_helper'

describe InstitutionsController do

  describe "GET 'getInstitutionsNames'" do
    it "returns http success" do
      get 'getInstitutionsNames'
      response.should be_success
    end
  end

end
