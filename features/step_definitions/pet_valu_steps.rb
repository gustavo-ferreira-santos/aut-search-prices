Dado('Acessar a home do site pet valu') do
  pet_valu.load
  pet_valu.wait_until_btn_confirm_store_visible(wait: 10)
  pet_valu.btn_confirm_store.click
  pet_valu.btn_accept_cookies.click
end

Quando('acessar a PDP pet valu e capturar o preco') do
  # criando planilha
  planilha = Spreadsheet::Workbook.new
  aba = planilha.create_worksheet(name: 'Dados Automação')
  aba.row(0).push('DOGS')
  aba.row(1).push('PRODUCT NAME', 'PRODUCT SIZE', 'PRODUCT PRICE')

  @linha = 2

  puts 'Obtendo preços preços dos produtos para CÃES'
  products_dogs = data_load(%w[pet_valu products_list_dogs])
  products_dogs.each do |product_dog|
    visit product_dog
    if has_css?('[class="Modal__Close"]', wait: 5)
      puts "modal aberto"
      pet_valu.btn_modal_close.click
    else
      puts "modal nao aberto"
    end

    nome_produto = pet_valu.product_title.text
    options = pet_valu.size_btn.all('button')

    options.each do |size_option|
      size = size_option.text

      size_option.select_option

      preco_produto =  pet_valu.label_price.text

      aba.row(@linha).push(nome_produto, size, preco_produto)
      @linha+=1
    end
  end
  planilha.write 'Pet-Valu.xls'
end

Entao('preencher a planilha pet valu com o preco capturado') do
  expect(Pathname.new('Pet-Valu.xls')).to exist
end
