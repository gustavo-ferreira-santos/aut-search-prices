#language: pt

@escrever_planilha
Funcionalidade: Planilha - Validar poc para acessar site e escrever planilha
  Como usuário do sistema
  Quero acessar as PDP's de produto
  Para capturar preços e escrever em uma planilha

  @rens_spot
  Cenário: Validar poc planilha
    Dado Acessar a home do site rens pets
    Quando acessar a PDP e capturar o preco
    Entao preencher a planilha com o preco capturado