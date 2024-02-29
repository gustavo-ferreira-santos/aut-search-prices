#language: pt

@escrever_planilha_homes_alive
Funcionalidade: Pesquisar preçoes na homes alive e escrever planilha
  Como usuário do sistema
  Quero acessar as PDP's de produto
  Para capturar preços e escrever em uma planilha

  @homes_alive
  Cenário: Escrever planilha homes alive
    Dado Acessar a home do site homes alive
    Quando acessar a PDP homes alive e capturar o preco
    Entao preencher a planilha homes alive com o preco capturado