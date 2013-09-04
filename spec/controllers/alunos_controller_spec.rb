require 'spec_helper'

describe AlunosController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'profileimage'" do
    it "returns http success" do
      get 'profileimage'
      response.should be_success
    end
  end

  describe "GET 'changeimage'" do
    it "returns http success" do
      get 'changeimage'
      response.should be_success
    end
  end

  describe "GET 'removeimage'" do
    it "returns http success" do
      get 'removeimage'
      response.should be_success
    end
  end

  describe "GET 'password'" do
    it "returns http success" do
      get 'password'
      response.should be_success
    end
  end

  describe "GET 'changepassword'" do
    it "returns http success" do
      get 'changepassword'
      response.should be_success
    end
  end

end
