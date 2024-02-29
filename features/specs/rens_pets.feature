#language: pt

@escrever_planilha_rens_spot
Funcionalidade: Pesquisar preços na rens spot e escrever planilha
  Como usuário do sistema
  Quero acessar as PDP's de produto
  Para capturar preços e escrever em uma planilha

  @rens_spot
  Cenário: Escrever planilha rens spot
    Dado Acessar a home do site rens pets
    Quando acessar a PDP e capturar o preco
    Entao preencher a planilha com o preco capturado