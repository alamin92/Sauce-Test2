class InventoryPage
    include PageObject

    button(:menu, :css => "button#react-burger-menu-btn")
    link(:log_out, :id => "logout_sidebar_link")
    
    def log_out
        self.menu.click
        self.log_out.click
    end
end 