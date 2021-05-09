

class LoginPage
    def initialize(driver)
        @driver = driver
    end 
    def username 
         @driver.find_element(:css, "input#user-name")
    end
    
    def password
         @driver.find_element(:css, "input#password")
    end

    def log_in_button
        @driver.find_element(:css, "input#login-button")
    end

    def login(user_name, password)
        user_name_field = username()
        user_name_field.clear()
        user_name_field.send_keys(user_name)
        password_field = password()
        password_field.clear()
        password_field.send_keys(password)
        log_in_button().click
    end
end 