require 'spec_helper'

describe "distributions/show" do
  before(:each) do
    @distribution = assign(:distribution, stub_model(Distribution,
      :site => "Site",
      :age => "Age",
      :population => "9.99",
      :customer => "9.99"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Site/)
    rendered.should match(/Age/)
    rendered.should match(/9.99/)
    rendered.should match(/9.99/)
  end
end
