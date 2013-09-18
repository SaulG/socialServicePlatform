require 'spec_helper'

describe "StaticPages" do
    describe "Home page" do
        it "should have the h1 'SocialServicePlatform" do
            visit '/static_pages/home'
            page.should have_selector('h1', :text => 'SocialServicePlatform')
        end
        it "should have the title 'Home'" do
            visit '/static_pages/home'
            page.should have_selector('title', :text => 'SocialServicePlatform | Home')
        end
    end

    describe "About page" do
        it "should have the h1 'SocialServicePlatform" do
            visit '/static_pages/about'
            page.should have_selector('h1', :text => 'About')
        end
        it "should have the title 'About'" do
            visit '/static_pages/about'
            page.should have_selector('title', :text => 'SocialServicePlatform | About')
        end
    end
    describe "Help page" do
        it "should have the h1 'SocialServicePlatform" do
            visit '/static_pages/help'
            page.should have_selector('h1', :text => 'Help')
        end
        it "should have the title 'Help'" do
            visit '/static_pages/help'
            page.should have_selector('title', :text => 'SocialServicePlatform | Help')
        end
    end
end
