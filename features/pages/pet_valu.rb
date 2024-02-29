class PetValu <::SitePrism::Page
  set_url 'https://www.petvalu.ca/'
  element :btn_confirm_store, '[aria-label="Confirm Store"]'
  element :btn_accept_cookies, '[aria-label="Accept all cookies"]'
  element :btn_modal_close, '[class="Modal__Close"]'
  element :product_title, '[class="productHeader__title h1"]'
  element :size_btn, '.variants'
  element :label_price, '[class="productDetails__price productDetails__salePrice"]'
end
