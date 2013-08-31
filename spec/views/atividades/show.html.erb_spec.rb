require 'spec_helper'

describe "atividades/show" do
  before(:each) do
    @atividade = assign(:atividade, stub_model(Atividade,
      :title => "Title",
      :horasganhas => 1.5
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/1.5/)
  end
end
