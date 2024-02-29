Dado('Acessar a home do site global pet') do
  global_pet.load
  global_pet.wait_until_global_logo_visible(wait: 10)
end

Quando('acessar a PDP global pet e capturar o preco') do
  # criando planilha
  planilha = Spreadsheet::Workbook.new
  aba = planilha.create_worksheet(name: 'Dados Automação')
  aba.row(0).push('DOGS')
  aba.row(1).push('PRODUCT NAME', 'PRODUCT SIZE', 'PRODUCT PRICE')

  @linha = 2

  puts 'Obtendo preços preços dos produtos para CÃES'
  products_dogs = data_load(%w[global_pet products_list_dogs])
  products_dogs.each do |product_dog|
   visit product_dog

   nome_produto = global_pet.product_title.text
   size = global_pet.label_size.text
   preco_produto =  global_pet.label_price.text
   aba.row(@linha).push(nome_produto, size, preco_produto)
   @linha+=1
  end

  # inserindo cabeçalhos para info de produtos para gatos
  @linha+=1
  aba.row(@linha).push('CATS')
  @linha+=1
  aba.row(@linha).push('PRODUCT NAME', 'PRODUCT SIZE', 'PRODUCT PRICE')
  @linha+=1

  puts 'Obtendo preços preços dos produtos para GATOS'
  products_cats = data_load(%w[global_pet products_list_cats])
  products_cats.each do |product_cat|
    visit product_cat

    nome_produto = global_pet.product_title.text
    has_css?('div.size-box:nth-child(5) > h3.option-label.pull-left') ? size = global_pet.label_size.text : size = global_pet.secondary_label_size.text
    preco_produto =  global_pet.label_price.text
    aba.row(@linha).push(nome_produto, size, preco_produto)
    @linha+=1
  end
  planilha.write 'Global-Pet.xls'
end

Entao('preencher a planilha global pet com o preco capturado') do
  expect(Pathname.new('Global-Pet.xls')).to exist
end
