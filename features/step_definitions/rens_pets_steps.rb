Dado('Acessar a home do site rens pets') do
  rens_pets.load
  rens_pets.wait_until_btn_modal_close_visible(wait:10)
  rens_pets.btn_modal_close.click
  rens_pets.wait_until_rens_logo_visible(wait:10)
end

Quando('acessar a PDP e capturar o preco') do
  # criando planilha
  planilha = Spreadsheet::Workbook.new
  aba = planilha.create_worksheet(name: 'Dados Automação')
  aba.row(0).push('DOGS')
  aba.row(1).push('PRODUCT NAME', 'PRODUCT SIZE', 'PRODUCT PRICE')

  @linha = 2

  puts 'Obtendo preços preços dos produtos para CÃES'
  products_dogs = data_load(%w[rens_pet products_list_dogs])
  products_dogs.each do |product_dog|
    visit product_dog

    produto = product_dog.gsub('/',' ').split[3].gsub('-', ' ').gsub('?', ' ')
    split_nome_produto = produto.delete_suffix(produto.split.last).chop.capitalize
    nome_produto = split_nome_produto.split.each{|i| i.capitalize!}.join(' ')
    size = produto.split.pop.gsub!(/[^0-9A-Za-z]/, ' ')

    # if para automação realizar o refresh ocorra o crash da página
    if rens_pets.has_css?('.product-prices--details')
      puts 'página carregada com sucesso'
    else
      puts '404 na página'
      sleep(30)
      refresh
    end

    # if para automação popular planilha com mensagem de 404 caso preço não esteja visivel
    if rens_pets.has_css?('.product-prices--details')
      preco_produto = rens_pets.label_price.first.text
      # escrevendo informações dos produtos na planilha
      aba.row(@linha).push(nome_produto, size, preco_produto)
    else
      # escrevendo mensagem de not found na planilha em caso de erro
      aba.row(@linha).push(nome_produto, size, 'NOT_FOUND')
    end
    @linha+=1
    #sleep(3)
  end

  # inserindo cabeçalhos para info de produtos para gatos
  @linha+=1
  aba.row(@linha).push('CATS')
  @linha+=1
  aba.row(@linha).push('PRODUCT NAME', 'PRODUCT SIZE', 'PRODUCT PRICE')
  @linha+=1

  puts 'Obtendo preços preços dos produtos para GATOS'
  products_cats = data_load(%w[rens_pet products_list_cats])
  products_cats.each do |product_cat|
    visit product_cat

    produto = product_cat.gsub('/',' ').split[3].gsub('-', ' ').gsub('?', ' ')
    split_nome_produto = produto.delete_suffix(produto.split.last).chop.capitalize
    nome_produto = split_nome_produto.split.each{|i| i.capitalize!}.join(' ')
    size = produto.split.pop.gsub!(/[^0-9A-Za-z]/, ' ')

    # if para automação realizar o refresh ocorra o crash da página
    if rens_pets.has_css?('.product-prices--details')
      puts 'página carregada com sucesso'
    else
      puts '404 na página'
      sleep(30)
      refresh
    end

    # if para automação popular planilha com mensagem de 404 caso preço não esteja visivel
    if rens_pets.has_css?('.product-prices--details')
      preco_produto = rens_pets.label_price.first.text
      # escrevendo informações dos produtos na planilha
      aba.row(@linha).push(nome_produto, size, preco_produto)
    else
      # escrevendo mensagem de not found na planilha em caso de erro
      aba.row(@linha).push(nome_produto, size, 'NOT_FOUND')
    end
    @linha+=1
    #sleep(3)
  end

  # salvando planilha
  planilha.write 'Rens-Spot.xls'
end

Entao('preencher a planilha com o preco capturado') do
  expect(Pathname.new('Rens-Spot.xls')).to exist
end
