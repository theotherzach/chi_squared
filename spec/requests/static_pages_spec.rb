require 'spec_helper'

describe "Static pages" do
	subject {page}

	describe "Home page" do
		before { visit root_path }
		
		it { should have_selector('h1', text: 'Chi Squared Test')	}
  	it { should have_selector('h2', text: 'Directions')}
    it { should have_selector('li', text: 'Rank Sheets')}
    it { should have_selector('li', text: 'Reports')}
    it { should have_selector('sup', text: '2')}
  end
end