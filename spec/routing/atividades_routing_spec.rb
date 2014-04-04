require "spec_helper"

describe AtividadesController do
  describe "routing" do

    it "routes to #index" do
      get("/atividades").should route_to("atividades#index")
    end

    it "routes to #new" do
      get("/atividades/new").should route_to("atividades#new")
    end

    it "routes to #show" do
      get("/atividades/1").should route_to("atividades#show", :id => "1")
    end

    it "routes to #edit" do
      get("/atividades/1/edit").should route_to("atividades#edit", :id => "1")
    end

    it "routes to #create" do
      post("/atividades").should route_to("atividades#create")
    end

    it "routes to #update" do
      put("/atividades/1").should route_to("atividades#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/atividades/1").should route_to("atividades#destroy", :id => "1")
    end

  end
end
