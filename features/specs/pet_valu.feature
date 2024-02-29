#language: pt

@escrever_planilha_pet_valu
Funcionalidade: Pesquisar preços na pet_valu e escrever planilha
  Como usuário do sistema
  Quero acessar as PDP's de produto
  Para capturar preços e escrever em uma planilha

  @pet_valu
  Cenário: Escrever planilha pet valu
    Dado Acessar a home do site pet valu
    Quando acessar a PDP pet valu e capturar o preco
    Entao preencher a planilha pet valu com o preco capturado