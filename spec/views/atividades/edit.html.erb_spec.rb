require 'spec_helper'

describe "atividades/edit" do
  before(:each) do
    @atividade = assign(:atividade, stub_model(Atividade,
      :title => "MyString",
      :horasganhas => 1.5
    ))
  end

  it "renders the edit atividade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", atividade_path(@atividade), "post" do
      assert_select "input#atividade_title[name=?]", "atividade[title]"
      assert_select "input#atividade_horasganhas[name=?]", "atividade[horasganhas]"
    end
  end
end
