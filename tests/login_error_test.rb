require 'rspec'
require "selenium-webdriver"
require './pages/login_page'
require './pages/inventory_page'


RSpec.configure do |config|
 config.before (:all) do
  @driver = Selenium::WebDriver.for :chrome
  @driver.manage.timeouts.implicit_wait = 50
  wait = Selenium::WebDriver::Wait.new(:timeout => 10)
  #@driver.manage.timeouts.script_timeout = 30
  @driver.navigate.to 'https://www.saucedemo.com/inventory.html'
end
 config.after (:all) do
  @driver.quit
end

describe "login_fail"  do
    it "user should not able to log in" do
    login_page = LoginPage.new(@driver)
    login_page.login("standard_use", "secret_sauc")
    # wait.until{document_initialised driver}
    error_msg = @driver.find_element(:xpath, "//div[@id='login_button_container']//form/h3")
    expect(error_msg.text).to eq("Epic sadface: Username and password do not match any user in this service")
    end

    #  --> locked out user  <-- 
    
    it "user should not able to log in" do 
    login_page = LoginPage.new(@driver)
    login_page.login("locked_out_user", "secret_sauce")
    error_msg = @driver.find_element(:xpath, "//div[@id='login_button_container']//form/h3")
    puts error_msg.text 
    expect(error_msg.text).to eq("Epic sadface: Sorry, this user has been locked out.")
    end
    

    #  --> problem_user  <-- #
    it "user should not able to checkout" do
       login_page = LoginPage.new(@driver)
       login_page.login("problem_user", "secret_sauce")
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
       error_msg = @driver.find_element(:xpath, "//div[@id='checkout_info_container']//form/h3")
       puts error_msg.text
       expect(error_msg.text).to eq("Error: Last Name is required")             
       end
      

       #  --> performance_glitch_user  <-- 
       it "user should not able to log in" do

        
        inventory_page = Inventory.new(@driver)
        login_page = LoginPage.new(@driver)
        inventory_page.logout_bar.click
        inventory_page.logout_link.click
        login_page.login("performance_glitch_user", "secret_sauce")
         if @driver.manage.timeouts.page_load = 2
            a = "here is glich"
            puts a
          end  
         expect(a).to eq("here is glich")        
  end
 end 
end

# homework 1 -> use one browser. 
# 