class GlobalPet <::SitePrism::Page
  set_url 'https://pei.globalpetfoods.com/'
  element :global_logo, '.logo'
  element :product_title, 'div.container div.row.product-detail-wrap div.col-sm-6:nth-child(2) > h1:nth-child(1)'
  element :btn_size, '[class="btn-group radio-group"]'
  element :label_size, 'div.size-box:nth-child(5) > h3.option-label.pull-left'
  element :secondary_label_size, 'div.row.product-detail-wrap div.col-sm-6:nth-child(2) div.size-box:nth-child(6) > h3.option-label.pull-left'
  element :label_price, '.current-price'
end
