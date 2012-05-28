require 'spec_helper'

describe "distributions/index" do
  before(:each) do
    assign(:distributions, [
      stub_model(Distribution,
        :site => "Site",
        :age => "Age",
        :population => "9.99",
        :customer => "9.99"
      ),
      stub_model(Distribution,
        :site => "Site",
        :age => "Age",
        :population => "9.99",
        :customer => "9.99"
      )
    ])
  end

  it "renders a list of distributions" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Site".to_s, :count => 2
    assert_select "tr>td", :text => "Age".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
  end
end
