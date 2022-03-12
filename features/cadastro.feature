#language: pt

Funcionalidade: Cadastro
  Sendo um músico que possui equipamentos musicais
  Quero fazer o meu cadastro no Rocklov
  Para que eu possa disponibilizá-los para locação

  @temp
  Cenario: Fazer cadastro 
    
    Dado que acesso a página de cadastro
    Quando submeto o meu cadastro completo
    Então sou redirecionado para o Dashboard

  @sem_nome
  Cenario: Submeter cadastro sem o nome

    Dado que acesso a página de cadastro
    Quando submeto o meu cadastro sem o nome
    Então vejo a mensagem de alerta: Oops. Informe seu nome completo!


  Cenario: Submeter cadastro sem o email

    Dado que acesso a página de cadastro
    Quando submeto o meu cadastro sem o email
    Então vejo a mensagem de alerta: Oops. Informe um email válido!


  Cenario: Submeter cadastro com email inválido

    Dado que acesso a página de cadastro
    Quando submeto o meu cadastro com email inválido
    Então vejo a mensagem de alerta: Oops. Informe um email válido!


  Cenario: Submeter cadasto sem a senha
    
    Dado que acesso a página de cadastro
    Quando submeto o meu cadastro sem a senha
    Então vejo a mensagem de alerta: Oops. Informe sua senha secreta!