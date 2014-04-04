require 'spec_helper'

describe "atividades/index" do
  before(:each) do
    assign(:atividades, [
      stub_model(Atividade,
        :title => "Title",
        :horasganhas => 1.5
      ),
      stub_model(Atividade,
        :title => "Title",
        :horasganhas => 1.5
      )
    ])
  end

  it "renders a list of atividades" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => 1.5.to_s, :count => 2
  end
end
