require 'spec_helper'

describe ProcessStudentsController do

  describe "GET 'selection'" do
    it "returns http success" do
      get 'selection'
      response.should be_success
    end
  end

  describe "GET 'interview'" do
    it "returns http success" do
      get 'interview'
      response.should be_success
    end
  end

  describe "GET 'working'" do
    it "returns http success" do
      get 'working'
      response.should be_success
    end
  end

  describe "GET 'release'" do
    it "returns http success" do
      get 'release'
      response.should be_success
    end
  end

  describe "GET 'ending'" do
    it "returns http success" do
      get 'ending'
      response.should be_success
    end
  end

end
