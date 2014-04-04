require 'spec_helper'

describe "atividades/new" do
  before(:each) do
    assign(:atividade, stub_model(Atividade,
      :title => "MyString",
      :horasganhas => 1.5
    ).as_new_record)
  end

  it "renders new atividade form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", atividades_path, "post" do
      assert_select "input#atividade_title[name=?]", "atividade[title]"
      assert_select "input#atividade_horasganhas[name=?]", "atividade[horasganhas]"
    end
  end
end
