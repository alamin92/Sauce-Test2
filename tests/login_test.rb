require 'rspec'
require "selenium-webdriver"
require './pages/login_page'


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
            user = login_page.username

            user.send_keys("standard_user")
            # puts user.text
            sleep 2
        
            pass = login_page.password

            pass.send_keys("secret_sauce")
            
            login_page.log_in_button.click

            nxt = @driver.find_element(:css, "div:nth-of-type(1) > .pricebar > .btn_inventory.btn_primary")
            
            expect(nxt.displayed? ).to be_truthy 
        

        end
    end 
    # after :example do
    #     @driver.quit
    # end
end






# # require "selenium-webdriver"
# # driver = Selenium::WebDriver.for :chrome
# # driver.navigate.to 'https://www.saucedemo.com/inventory.html'


# user = driver.find_element(:css, "input#user-name")
# user.send_keys("standard_user")
# # puts user.text


# sleep 2


# pass = driver.find_element(:css, "input#password")
# pass.send_keys("secret_sauce")


# driver.find_element(:css, "input#login-button").click

# nxt = driver.find_element(:css, "div:nth-of-type(1) > .pricebar > .btn_inventory.btn_primary")

# puts nxt.displayed? == true

# sleep 5000