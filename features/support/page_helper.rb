Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file}

module PageObjects
    def rens_pets
        RensPets.new
    end

    def homes_alive
        HomesAlive.new
    end
end
