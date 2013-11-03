require 'spec_helper'

describe PruebaController do

  describe "GET 'muestra_plazas'" do
    it "returns http success" do
      get 'muestra_plazas'
      response.should be_success
    end
  end

end
