# aut-search-prices

* Sobre o projeto

O projeto foi desenvolvido utilizando as seguintes tecnologias:
  - Ruby na versão 3.1.0
  - gems capybara, cucumber, rspec, selenium-webdriver, site_prism e spreadsheet

* Configuração do projeto:

  - É necessário a instalação do ruby na versão 3.1.0 e
  - É necessário download do chromedriver na versão correspondente a instalada na máquina (ex: se o chrome na máquina é a versão **121**.0.2277.128 então o chromedriver correspondente seria o da versão **121**)
  - Após o download do chromedriver o arquivo deve ser movido para a pasta **\bin**
 
  * Execução dos scripts:

  - Para execução dos cripts é necessário abrir o terminal e digitar o comando: **cucumber -t @tag_a_ser_executada**
   - Após o término da execução o arquivo **.xls** é criado na raiz do projeto
