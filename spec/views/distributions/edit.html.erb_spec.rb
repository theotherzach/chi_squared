require 'spec_helper'

describe "distributions/edit" do
  before(:each) do
    @distribution = assign(:distribution, stub_model(Distribution,
      :site => "MyString",
      :age => "MyString",
      :population => "9.99",
      :customer => "9.99"
    ))
  end

  it "renders the edit distribution form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => distributions_path(@distribution), :method => "post" do
      assert_select "input#distribution_site", :name => "distribution[site]"
      assert_select "input#distribution_age", :name => "distribution[age]"
      assert_select "input#distribution_population", :name => "distribution[population]"
      assert_select "input#distribution_customer", :name => "distribution[customer]"
    end
  end
end
