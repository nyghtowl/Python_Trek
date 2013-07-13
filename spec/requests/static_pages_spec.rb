require 'spec_helper'

describe "StaticPages" do

  describe "Home page" do
    it "should have the content 'Python Trek'" do
      visit '/static_pages/home'
      page.should have_content('Python Trek')
    end
  end
end
