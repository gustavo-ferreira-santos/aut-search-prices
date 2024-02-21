Dir[File.join(File.dirname(__FILE__), '../pages/*_page.rb')].each { |file| require file}

module PageObjects
    def form_seguro
        FormSeguro.new
    end

    def rens_pets
        RensPets.new
    end
end
