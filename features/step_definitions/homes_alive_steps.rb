Dado('Acessar a home do site homes alive') do
  homes_alive.load
  homes_alive.wait_until_homes_alive_logo_visible(wait:10)
end

Quando('acessar a PDP homes alive e capturar o preco') do

  # criando planilha
  planilha = Spreadsheet::Workbook.new
  aba = planilha.create_worksheet(name: 'Dados Automação')
  aba.row(0).push('DOGS')
  aba.row(1).push('PRODUCT NAME', 'PRODUCT SIZE', 'PRODUCT PRICE')

  @linha = 2

  puts 'Obtendo preços preços dos produtos para CÃES'
  products_dogs = data_load(%w[homes_alive products_list_dogs])

  products_dogs.each do |product_dog|
    visit product_dog

    nome_produto = homes_alive.product_title.text

    if has_css?('#attribute186')
      options = homes_alive.dropdown_size.all('option')
    elsif has_css?('#attribute197')
      options = homes_alive.secondary_dropdown_size.all('option')
    else
      puts "Existe apenas um tamanho para o produto #{product_dog}"
    end

    if has_selector?('#attribute186, #attribute197')
      options_sizes = options.drop(1)

      options_sizes.each do |size_option|
        size = size_option.text
        size_option.select_option

        if has_xpath?('/html[1]/body[1]/div[2]/main[1]/div[2]/div[1]/div[4]/div[3]/div[1]/span[2]/span[1]/span[2]/span[1]')
          preco_produto =  homes_alive.label_price.text
        else
          preco_produto =  homes_alive.secondary_label_price.first.text
        end

        # if para automação popular planilha com mensagem de 404 caso preço não esteja visivel
        if has_css?('[data-ui-id="page-title-wrapper"]')
          # escrevendo informações dos produtos na planilha
          aba.row(@linha).push(nome_produto, size, preco_produto)
        else
          # escrevendo mensagem de not found na planilha em caso de erro
          aba.row(@linha).push(nome_produto, size, 'NOT_FOUND')
        end
        @linha+=1
      end
    else
      size = "Size not informed"
      preco_produto =  homes_alive.secondary_label_price.first.text

      # if para automação popular planilha com mensagem de 404 caso preço não esteja visivel
      if has_css?('[data-ui-id="page-title-wrapper"]')
        # escrevendo informações dos produtos na planilha
        aba.row(@linha).push(nome_produto, size, preco_produto)
      else
        # escrevendo mensagem de not found na planilha em caso de erro
        aba.row(@linha).push(nome_produto, size, 'NOT_FOUND')
      end
      @linha+=1
    end
  end

  # inserindo cabeçalhos para info de produtos para gatos
  @linha+=1
  aba.row(@linha).push('CATS')
  @linha+=1
  aba.row(@linha).push('PRODUCT NAME', 'PRODUCT SIZE', 'PRODUCT PRICE')
  @linha+=1

  puts 'Obtendo preços preços dos produtos para GATOS'
  products_cats = data_load(%w[homes_alive products_list_cats])

  products_cats.each do |products_cat|
    visit products_cat

    nome_produto = homes_alive.product_title.text

    if has_css?('#attribute186')
      options = homes_alive.dropdown_size.all('option')
    elsif has_css?('#attribute197')
      options = homes_alive.secondary_dropdown_size.all('option')
    else
      puts "Existe apenas um tamanho para o produto #{products_cat}"
    end

    if has_selector?('#attribute186, #attribute197')
      options_sizes = options.drop(1)

      options_sizes.each do |size_option|
        size = size_option.text
        size_option.select_option

        if has_xpath?('/html[1]/body[1]/div[2]/main[1]/div[2]/div[1]/div[4]/div[3]/div[1]/span[2]/span[1]/span[2]/span[1]')
          preco_produto =  homes_alive.label_price.text
        else
          preco_produto =  homes_alive.secondary_label_price.first.text
        end

        # if para automação popular planilha com mensagem de 404 caso preço não esteja visivel
        if has_css?('[data-ui-id="page-title-wrapper"]')
          # escrevendo informações dos produtos na planilha
          aba.row(@linha).push(nome_produto, size, preco_produto)
        else
          # escrevendo mensagem de not found na planilha em caso de erro
          aba.row(@linha).push(nome_produto, size, 'NOT_FOUND')
        end
        @linha+=1
      end
    else
      size = "Size not informed"
      preco_produto =  homes_alive.secondary_label_price.first.text

      # if para automação popular planilha com mensagem de 404 caso preço não esteja visivel
      if has_css?('[data-ui-id="page-title-wrapper"]')
        # escrevendo informações dos produtos na planilha
        aba.row(@linha).push(nome_produto, size, preco_produto)
      else
        # escrevendo mensagem de not found na planilha em caso de erro
        aba.row(@linha).push(nome_produto, size, 'NOT_FOUND')
      end
      @linha+=1
    end
  end

  # salvando planilha
  planilha.write 'Homes-Alive.xls'
end

Entao('preencher a planilha homes alive com o preco capturado') do
  expect(Pathname.new('Homes-Alive.xls')).to exist
end
