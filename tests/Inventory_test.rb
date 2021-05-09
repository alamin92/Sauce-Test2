require 'rspec'
require "selenium-webdriver"
require './pages/login_page'
require './pages/inventory_page'


RSpec.describe "Thing" do
    before :example do
        @driver = Selenium::WebDriver.for :chrome
        @driver.manage.timeouts.implicit_wait = 200
        @driver.navigate.to 'https://www.saucedemo.com/inventory.html'    
    end
    after :example do
        @driver.quit
    end

    describe 'login' do
            it 'User should log in with correct ...' do
            
            @driver.navigate.to 'https://www.saucedemo.com/inventory.html'
            login_page = LoginPage.new(@driver)
            login_page.login("standard_user", "secret_sauce")    
            sleep 2      
            nxt = @driver.find_element(:css, "div:nth-of-type(1) > .pricebar > .btn_inventory.btn_primary")
            @driver.find_element(:css, "div:nth-of-type(1) > .pricebar > .btn_inventory.btn_primary").click 
            @driver.find_element(:css, "[fill]").click 
            @driver.find_element(:css, ".checkout_button").click
            fname = @driver.find_element(:css, "input#first-name")
            fname.send_keys("almin")
            lname = @driver.find_element(:css, "input#last-name")
            lname.send_keys("hossain")
            zip = @driver.find_element(:css, "input#postal-code")
            zip.send_keys("12345")
            @driver.find_element(:css, ".btn_primary.cart_button").click
            @driver.find_element(:xpath, "//div[@id='checkout_info_container']//form/h3")
            expect(nxt.displayed? ).to be_truthy 
        
    end 
end

