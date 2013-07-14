require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    before { visit root_path }
    #   puts page.body 
    # end

    subject do 
        page
    end


    it { should have_selector 'h1',    text: 'Python Trek' }
    # it { should have_selector 'title', text: 'Python Trek' }
  # end

  end
  
  # it "should have the right links on the layout" do
  #   visit root_path
  #   click_link "Tweet"
  #   page.should have_selector 'title', text: 'Tweet'
  # end


end
