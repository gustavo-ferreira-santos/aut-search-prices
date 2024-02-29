#language: pt

@escrever_planilha_glogal_pet
Funcionalidade: Pesquisar preços na global pet e escrever planilha
  Como usuário do sistema
  Quero acessar as PDP's de produto
  Para capturar preços e escrever em uma planilha

  @global_pet
  Cenário: Escrever planilha global pet
    Dado Acessar a home do site global pet
    Quando acessar a PDP global pet e capturar o preco
    Entao preencher a planilha global pet com o preco capturado