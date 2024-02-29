require 'capybara/cucumber'
require 'rspec'
require 'selenium-webdriver'
require 'site_prism'
require_relative 'page_helper.rb'
require 'pry'
require 'spreadsheet'

World(PageObjects)

def load_yaml_file(path)
  YAML.load_file(File.dirname(__FILE__) + path)
end

STANDARD_DATA = load_yaml_file('/data/data.yaml')

Capybara.register_driver :custom_chrome do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new # cliente http personalizado para aumentar o tempo limite de resposta do navegador para o chromedriver
  client.read_timeout = 10
  options = Selenium::WebDriver::Chrome::Options.new
  #options.add_argument('--headless')
  options.add_argument('--no-sandbox')
  #options.add_argument('--disable-gpu')
  options.add_argument('--window-size=1920,1080')
  options.add_argument('--start-maximized')
  #options.add_argument('--disable-dev-shm-usage')
  #options.add_argument('--enable-features=NetworkService,NetworkServiceInProcess')
  Capybara::Selenium::Driver.new(app, browser: :chrome, options: options, http_client: client)
end

Capybara.configure do |config|
  config.default_driver = :custom_chrome
  Capybara.page.current_window.resize_to(1920, 1080)
end

RSpec.configure do |config|
  config.after(:suite) do
    Capybara.send(:session_pool).each do |name, session|
      # Verifica se a sessão é do driver do Chrome
      if session.driver.browser.is_a?(Capybara::Selenium::Driver) &&
         session.driver.browser.browser == :chrome
        # Fecha o navegador associado à sessão
        session.driver.quit
      end
    end
  end
end
