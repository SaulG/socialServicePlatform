require 'spec_helper'

describe "StaticPages" do
    let(:base_title) {"Social Service Platform"}
    describe "Home page" do
        it "should have the h1 Social Service Platform" do
            visit '/static_pages/home'
            page.should have_selector('h1', :text => "#{base_title}")
        end
        it "should have the title Home" do
            visit '/static_pages/home'
            page.should have_selector('title', :text => "#{base_title}")
        end
        it "should not have a custom page title" do
            visit '/static_pages/home'
            page.should_not have_selector('title', :text => '| Home')
        end

    end

    describe "About page" do
        it "should have the h1 'SocialServicePlatform" do
            visit '/static_pages/about'
            page.should have_selector('h1', :text => 'About')
        end
        it "should have the title 'About'" do
            visit '/static_pages/about'
            page.should have_selector('title', :text => "#{base_title} | About")
        end
    end
    describe "Help page" do
        it "should have the h1 'SocialServicePlatform" do
            visit '/static_pages/help'
            page.should have_selector('h1', :text => 'Help')
        end
        it "should have the title 'Help'" do
            visit '/static_pages/help'
            page.should have_selector('title', :text => "#{base_title} | Help")
        end
    end
end