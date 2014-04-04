require 'spec_helper'

describe AvaliacoesController do

  describe "GET 'listar_atividades'" do
    it "returns http success" do
      get 'listar_atividades'
      response.should be_success
    end
  end

  describe "GET 'designar'" do
    it "returns http success" do
      get 'designar'
      response.should be_success
    end
  end

  describe "GET 'list'" do
    it "returns http success" do
      get 'list'
      response.should be_success
    end
  end

  describe "GET 'x_list'" do
    it "returns http success" do
      get 'x_list'
      response.should be_success
    end
  end

  describe "GET 'avaliar_atividade'" do
    it "returns http success" do
      get 'avaliar_atividade'
      response.should be_success
    end
  end

  describe "GET 'list_avaliacoes'" do
    it "returns http success" do
      get 'list_avaliacoes'
      response.should be_success
    end
  end

  describe "GET 'exibir_avaliacoes'" do
    it "returns http success" do
      get 'exibir_avaliacoes'
      response.should be_success
    end
  end

end
