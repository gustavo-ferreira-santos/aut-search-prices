class HomesAlive <::SitePrism::Page
  set_url 'https://www.homesalive.ca/'
  element :homes_alive_logo, '[title="Homes Alive Pets"]'
  element :dropdown_size, '#attribute186'
  element :secondary_dropdown_size, '#attribute197'
  element :label_price, :xpath, '/html[1]/body[1]/div[2]/main[1]/div[2]/div[1]/div[4]/div[3]/div[1]/span[2]/span[1]/span[2]/span[1]'
  elements :secondary_label_price, '[data-price-type="finalPrice"]'
  element :product_title, '[data-ui-id="page-title-wrapper"]'
end
