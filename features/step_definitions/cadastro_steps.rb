Dado('que acesso a página de cadastro') do
  visit "rocklov-web:3000/signup"
end

Quando('submeto o meu cadastro completo') do
  find("#fullName").set "Roberto Filho"
  find("#email").set Faker::Internet.free_email
  find("#password").set "pwd123"
  click_button("Cadastrar")
end

Então('sou redirecionado para o Dashboard') do
  expect(page).to have_css ".dashboard"
  sleep 10
end


Quando('submeto o meu cadastro sem o nome') do
  find("#email").set Faker::Internet.free_email
  find("#password").set "pwd123"
  click_button("Cadastrar")
end

Então('vejo a mensagem de alerta: Oops. Informe seu nome completo!') do
  alert = find(".alert-dark")
  expect(alert.text).to eql "Oops. Informe seu nome completo!"
end