require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    before { visit root_path }
    #   puts page.body 
    # end

    subject do 
        page
    end

    # it do 
    #     page.should have_selector 'h1'
    # end

    it { should have_selector 'h1',    text: 'Python Trek' }
    # it { should have_selector 'title', text: 'Python Trek' }
  # end
    # it "should have the h1 'Python Trek'" do
    #   visit root_path
    #   page.should have_content('Python Trek')
    # end
    # it "should have the title 'Python Trek'" do
    #   visit root_path
    #   page.should have_content('Python Trek')
    # end
  end
  
  # it "should have the right links on the layout" do
  #   visit root_path
  #   click_link "Tweet"
  #   page.should have_selector 'title', text: 'Tweet'
  # end


end
