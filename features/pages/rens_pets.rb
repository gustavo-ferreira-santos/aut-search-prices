class RensPets <::SitePrism::Page
  set_url 'https://www.renspets.com/'
  element :btn_modal_close, '#wps-overlay-close-button'
  element :rens_logo, '.page-header__logo'
  element :rens_tab_search, '#storefront_search'
  elements :btn_size, '.option-button'
  elements :label_price, '.product-prices__section--price'

  def wait_page_loaded
    while true
      break if execute_script('return document.readyState;') == 'complete'
      if Time.now > start + 5.seconds
        fail "Image still not loaded"
      end
      sleep 0.1
    end
  end
end
